public with sharing class EscalateToHumanAgent {

    public class Response {
        @InvocableVariable(label='Status Message')
        public String message;
    }

    public class Request {
        @InvocableVariable(required=true label='Record Id')
        public Id recordId;
    }

    @InvocableMethod(label='Escalate to Human Agent (Auto Queue)'
                     description='Automatically assigns the conversation record to an available Omni-Channel queue for human handling.')
    public static List<Response> sendToOmniChannel(List<Request> requests) {
        List<Response> results = new List<Response>();
        Response res = new Response();

        try {
            Request req = requests[0];
            res.message = escalateToQueue(req.recordId);
        } catch (Exception e) {
            res.message = '⚠️ Escalation failed: ' + e.getMessage();
        }

        results.add(res);
        return results;
    }

    // New helper method for direct Apex calls or anonymous execution
    public static String escalateToQueue(Id recordId) {
        if (recordId == null) {
            throw new AuraHandledException('Record Id must be provided.');
        }

        // Retrieve the record (Case assumed here; adjust if needed)
        SObject recordToRoute = [SELECT Id FROM Case WHERE Id = :recordId LIMIT 1];

        // Get first available Queue
        Group targetQueue = [SELECT Id, Name FROM Group WHERE Type = 'Queue' LIMIT 1];

        if (targetQueue == null) {
            throw new AuraHandledException('No queues found in the system.');
        }

        // Assign to queue
        recordToRoute.put('OwnerId', targetQueue.Id);
        update recordToRoute;

        return '✅ Conversation routed automatically to queue: ' + targetQueue.Name;
    }
}
public with sharing class EscalateToHumanAgentAction {
    
    @AuraEnabled
    public static String escalateToQueue(Id recordId) {
        // Predefined queue name
        String queueName = 'Message Queue'; 
        
        // Get Queue Id
        Group queue = [
            SELECT Id 
            FROM Group 
            WHERE Type = 'Queue' AND Name = :queueName
            LIMIT 1
        ];
        
        if (queue != null) {
            // Assign record to queue
            Case c = [SELECT Id, OwnerId FROM Case WHERE Id = :recordId LIMIT 1];
            c.OwnerId = queue.Id;
            update c;
            return 'Record escalated to queue: ' + queueName;
        }
        
        return 'Queue not found';
    }
}
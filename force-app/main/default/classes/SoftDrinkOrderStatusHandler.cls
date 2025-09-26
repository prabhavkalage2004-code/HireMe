public with sharing class SoftDrinkOrderStatusHandler {

    public class Request {
        @InvocableVariable(required=true description='Order number for the soft drink order')
        public Integer orderNumber;
    }

    public class Response {
        @InvocableVariable(description='Status of the given soft drink order')
        public String status;
    }

    @InvocableMethod(label='Get Soft Drink Order Status'
                     description='Returns the status of a soft drink order based on the provided order number')
    public static List<Response> getStatus(List<Request> requests) {
        List<Response> results = new List<Response>();

        for (Request req : requests) {
            Response res = new Response();

            List<Soft_Drink_Order__c> orders = [
                SELECT Status__c
                FROM Soft_Drink_Order__c
                WHERE Order_Number__c = :req.orderNumber
                LIMIT 1
            ];

            res.status = orders.isEmpty() ? 'Order not found' : orders[0].Status__c;
            results.add(res);
        }
        return results;
    }
}
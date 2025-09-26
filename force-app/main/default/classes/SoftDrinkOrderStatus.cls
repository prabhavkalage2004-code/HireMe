public with sharing class SoftDrinkOrderStatus {
    public class Request {
        @InvocableVariable(required=true description='Order number of the soft drink order')
        public Integer orderNumber;
    }
    public class Response {
        @InvocableVariable(description='Status of the soft drink order')
        public String status;
    }

    @InvocableMethod(label='Order Status' description='Returns the status of the soft drink order')
    public static List<Response> getStatus(List<Request> requests) {
        List<Response> results = new List<Response>();
        for (Request req : requests) {
            Response res = new Response();
            if (req.orderNumber == null) {
                res.status = 'Please provide a valid Order Number';
            } else {
                List<Soft_Drink_Order__c> orders = [
                    SELECT Status__c
                    FROM Soft_Drink_Order__c
                    WHERE Order_Number__c = :req.orderNumber
                    LIMIT 1
                ];
                res.status = orders.isEmpty() ? 'Order not found' : orders[0].Status__c;
            }
            results.add(res);
        }
        return results;
    }
}
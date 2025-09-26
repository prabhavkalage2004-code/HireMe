public class BeforeUpdate2HandlerPosition {
    
    public static void updateOperation(List<Position__c>poslist)
    {
        for(Position__c pos:poslist)
        {
            if(pos.status__c == 'Open-Approved')
            {
                pos.Open_Date__c = Date.today();
            }
            
            if(pos.status__c == 'Closed - Failed' || pos.status__c == 'Closed - Not Approved' || pos.status__c == 'Closed - Cancel' )
            {
                pos.Close_Date__c = Date.today();
            }


        }
    }

}
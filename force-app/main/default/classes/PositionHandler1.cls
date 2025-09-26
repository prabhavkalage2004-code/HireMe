public class PositionHandler1 {
    
    public static void populateDateAndPay(list<Position__c>poslist)
    {
       for(Position__c pos:poslist)
           if(pos.Status__c=='New Position' && pos.Open_Date__c==null && pos.Max_Pay__c==null && pos.Min_Pay__c==null )
       {
           pos.Open_Date__c=System.today();
           pos.Status__c='Open-Approved';
           pos.Min_Pay__c=10000;
           pos.Max_Pay__c=15000;
       }
        
       
    }

}
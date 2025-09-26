public class DMLDeletion {
    
    public static void DeleteAccount() {
        List<Account> accsql = [SELECT Id FROM Account WHERE CreatedDate = TODAY];

        delete accsql;
    }
    public static void DeletePosition()
    {
        Position__c pos=new Position__c();
        pos.Id='a00NS000018TvHAYA0';
        Delete pos;
    }
}
public class DMLInsertion {
    
    
    Public static Void InsertAccount()
    {
       
        List<Account> acclist=new  List<Account>();
        For (Integer i=0;i<=10;i++)
        {
             Account acc=new Account();
            acc.Name='Account'+i;
            acc.AccountNumber='123456789'+i;
            acclist.add(acc);
        }
        Insert acclist;
    }
    
    Public static void Insertposition()
    {
        list<Position__c> poslist=new  list<Position__c>();
        
        Position__c pos=new Position__c();
        pos.Name='Prabhav';
        pos.Minimum_Experience_Required__c=7;
        pos.Bypass_Validation_Skill_Required_Field__c=True;
        Insert pos;
        
        
    }
   


}
public class DMLUpdate {
    
    Public Static void updateAccount()
    {
        List<Account> acclist = [SELECT Id, Name FROM Account WHERE CreatedDate = TODAY];
        for(Integer i=0;i<=10;i++)
        {
           acclist[i].Name='Accenture'+i;
            
        }
        Update acclist;
    }
    
    Public Static void UpdatePosition()
    {
        Position__c pos=new Position__c();
        pos.Id='a00NS000018TvHAYA0';
        pos.Name='Prabhav 1000';
        pos.Bypass_Validation_Skill_Required_Field__c=True;
        pos.Min_Pay__c=1000;
        pos.Max_Pay__c=50000;
        pos.Type__c='Full Time';
        pos.Status__c='New Position';
        Update pos;
     }

}
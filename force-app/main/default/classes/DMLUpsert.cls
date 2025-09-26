public class DMLUpsert {
    
    public static void UpsertPosition()
    {
        List<Position__c> poslist=new List<Position__c>();
        Position__c pos1=new Position__c();
        
        pos1.Id='a00NS000018CDKYYA4';
        pos1.Name='Happy Anushka chaudhari';
        poslist.add(pos1);
         
        Position__c pos2=new Position__c();
        pos2.Name='Prabhav';
        pos2.Minimum_Experience_Required__c=7;
        pos2.Bypass_Validation_Skill_Required_Field__c=True;
        poslist.add(pos2);
        
        Upsert poslist;
        
        
    }

}
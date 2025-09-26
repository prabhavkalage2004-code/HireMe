public class DMLUndelete {
    
    public static void UndeletePosition()
    {
        List<Position__c> poslist=[Select Id ,Name from Position__c  where IsDeleted=True All Rows];
            Undelete poslist;
        System.debug(poslist.size());
    }

}
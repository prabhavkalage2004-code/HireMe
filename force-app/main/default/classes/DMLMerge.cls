public class DMLMerge {

    public static void mergeAccount() {
        Account acc1 = new Account();
        acc1.Id = '001NS00001HmqV5YAJ';

        Account acc2 = new Account();
        acc2.Id = '001NS00001HmqV4YAJ';

        merge acc1 acc2;
    }
    
    
    //Note:Specified type Position__c cannot be merged
   // public static void mergePosition() {
        //Position__c pos1 = new Position__c();
        //pos1.Id = 'a00NS000018TvHAYA0';

        //Position__c pos2 = new Position__c();
        //pos2.Id = 'a00NS000018Dj73YAC';

      //  merge pos1 pos2;
    //}
}
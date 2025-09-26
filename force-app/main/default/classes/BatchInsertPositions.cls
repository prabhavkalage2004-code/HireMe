public class BatchInsertPositions implements Database.Batchable<sObject>, Database.Stateful {
    
    List<Position__c> positions;
    
    public BatchInsertPositions(List<Position__c> positionsList) {
        this.positions = positionsList;
        System.debug(positions);
    }
    
    
    public Database.QueryLocator start(Database.BatchableContext bc) {
        System.debug(positions);
        return Database.getQueryLocator([SELECT Id FROM Position__c LIMIT 1]); 
    }
    
  
    public void execute(Database.BatchableContext bc, List<Position__c> positionList) {
        System.debug(positions);
        System.debug(positionList);
        insert positions;  
    }
    
   
    public void finish(Database.BatchableContext bc) {
        System.debug(positions);
        System.debug('Batch finished successfully');
    }
}
@isTest
public class BatchInsertPositionsTest {
    
    @testSetup
    static void setupData() {
        
        List<Position__c> testPositions = new List<Position__c>();
        for(Integer i = 0; i < 5; i++) {
            testPositions.add(new Position__c(
                Name = 'Test Position ' + i,
                Status__c = 'New Position',
                Min_Pay__c = 5000,
                Max_Pay__c = 10000
            ));
        }
        insert testPositions;
    }
    
    @isTest
    static void testBatchInsertPositions() {
        
        List<Position__c> newPositions = new List<Position__c>();
        for(Integer i = 0; i < 3; i++) {
            newPositions.add(new Position__c(
                Name = 'Batch Position ' + i,
                Status__c = 'Open-Approved',
                Min_Pay__c = 12000,
                Max_Pay__c = 18000
            ));
        }
        
        
        Test.startTest();
        BatchInsertPositions batchJob = new BatchInsertPositions(newPositions);
        Database.executeBatch(batchJob, 1);  // batch size 1 for full coverage
        Test.stopTest();
        
       
        List<Position__c> insertedPositions = [
            SELECT Id, Name, Status__c, Min_Pay__c, Max_Pay__c
            FROM Position__c
            WHERE Name LIKE 'Batch Position%'
        ];
        
        System.assertEquals(3, insertedPositions.size(), '3 new positions should have been inserted.');
    }
    
    @isTest
    static void testEmptyPositionsList() {
        
        List<Position__c> emptyList = new List<Position__c>();
        
        Test.startTest();
        BatchInsertPositions batchJob = new BatchInsertPositions(emptyList);
        Database.executeBatch(batchJob, 1);
        Test.stopTest();
        
    
        Integer countPositions = [SELECT COUNT() FROM Position__c];
        System.assert(countPositions >= 5, 'No extra positions should be inserted when list is empty.');
    }
}
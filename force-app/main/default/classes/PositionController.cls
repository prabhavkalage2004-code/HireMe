public with sharing class PositionController {

    // Fetch all positions
    @AuraEnabled(cacheable=true)
    public static List<Position__c> getPositions() {
        return [
            SELECT Id, Name, Status__c, Location__c
            FROM Position__c
            ORDER BY CreatedDate DESC
        ];
    }

    // Delete a list of records
    @AuraEnabled
    public static void deletePositions(List<Id> positionIds) {
        if (positionIds != null && !positionIds.isEmpty()) {
            List<Position__c> toDelete = [SELECT Id FROM Position__c WHERE Id IN :positionIds];
            delete toDelete;
        }
    }
}
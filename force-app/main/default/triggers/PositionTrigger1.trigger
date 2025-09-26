trigger PositionTrigger1 on Position__c (before insert) {
    
    if(Trigger.isinsert)
    {
        if(Trigger.isBefore)
        {
            PositionHandler1.populateDateAndPay(Trigger.new);
        }
    }

}
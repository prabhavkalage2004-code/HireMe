public class contactHandler2 {
    
    public static void validateAccountAnnualRevenue(List<Contact> conList) {
        Set<Id> accIdSet = new Set<Id>();
        
        for (Contact con : conList) {
            if (con.AccountId != null) {
                accIdSet.add(con.AccountId);
            }
        }
        
        if (accIdSet.isEmpty()) {
            return;
        }

        Map<Id, Account> accMap = new Map<Id, Account>(
            [SELECT Id, Name, AnnualRevenue FROM Account WHERE Id IN :accIdSet]
        );

        for (Contact con : conList) {
            Account acc = accMap.get(con.AccountId);
            if (acc != null && acc.AnnualRevenue <= 500000) {
                con.addError('You cannot create the contact for the given account because Annual Revenue is less than 5L');
            }
        }
    }
}
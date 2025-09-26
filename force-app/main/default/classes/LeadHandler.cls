public class LeadHandler {
    
    public static void DuplicateLeadError(List<Lead>leadlist)
    {
        set<String> lset=new set<String>();
        for(Lead le:leadlist)
        {
            if(le.Email!=null){
                
               lset.add(le.Email); 
            }
        }
        
       List<Lead> existingLeads = [SELECT Email FROM Lead WHERE Email IN :lset];
Set<String> leadset = new Set<String>();
for (Lead l : existingLeads) {
    if (l.Email != null) {
        leadset.add(l.Email);
    }
}
        for(lead le:leadlist)
        {
            if(leadset.contains(le.Email))
            {
                le.addError('Duplicate lead found with same email');
            }
        }
        
    }

}
public class OpportunityHandler1 {
    
    public static void showError(list<Opportunity>opplist)
    {
        for(Opportunity opp:opplist)
        {
            if(opp.Amount==null)
            {
                opp.addError('Amount is Required');
            }
        }
    }

}
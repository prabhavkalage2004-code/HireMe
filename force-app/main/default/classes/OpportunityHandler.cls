public class OpportunityHandler {
    
    public static void updateDescription(list<Opportunity>opplist)
    {
        for(Opportunity opp:opplist)
        {
            if(opp.Amount!=null && opp.Amount>100000)
            {
                opp.Description='Hot Rating';
            }
        }
    }


}
public class BeforeUpdate1HandlerAccount {
    
    Public static void updateDescription(List<Account>accnewlist,Map<Id,Account>accoldmap)
    {
        for(Account acc:accnewlist)
        {
            Account oldacc=accoldmap.get(acc.Id);
            if(acc.Phone!=oldacc.Phone){
                   acc.Description='Phone is updated! Old Value :'+oldacc.Phone+' &  New Value : '+acc.Phone;
                }

        }
    }

}
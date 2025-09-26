public class LoopStatement {
    
    public static void whileStatement(Integer i ,Integer n)
    {
        
        while(i<=n)
        {
                 System.debug(i);
            i++;
        }
    }
    
    public static void doWhileStatement(Integer i ,Integer n)
    {
        
        do
        {
                 System.debug(i);
            i++;
        }
        while(i>=n);
    }
    
    
    
      public static void forStatement(Integer i ,Integer n)
    {
        
       for(Integer j=i; j>=n;j--)
           
       {
           System.debug(j); 

       }
    }
    
    
    public static void SOQLforEachStatement1() 
    {
        
    List<Account> accList = [SELECT Id, Name FROM Account];
    
    for (Account acc : accList) {
        System.debug(acc);
        System.debug('Account Name: ' + acc.Name + ', Id: ' + acc.Id);

    }
}
    
    public static void SOQLforEachStatement() {
    for (Account acc : [SELECT Id, Name FROM Account]) {
        System.debug('Account Name: ' + acc.Name + ', Id: ' + acc.Id);
    }
}
    

    
    
}
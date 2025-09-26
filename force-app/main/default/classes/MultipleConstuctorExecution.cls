public class MultipleConstuctorExecution {
    
    public  MultipleConstuctorExecution()
    {
        this(5);
        System.debug('Hello');
        
    }
    
     public  MultipleConstuctorExecution(integer i)
    {
        this(10,15);
        System.debug(i);
    }
    
     public  MultipleConstuctorExecution(integer i,integer j)
    {
        
        System.debug(i+j);
    }

}
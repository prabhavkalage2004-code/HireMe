public class IfStatement {
    
    public static void first(Integer n)
    {
           if (n>10)

           {
               System.debug('Greater Than 10');
           }
    }
    
     public static void second(Integer n)
    {
           if (n>10 && n<100)

           {
               System.debug('n is between 10 and 100');
           }
        else
        {
                System.debug('Out of Range');
        }
    }
    
    
     public static void third(Integer n ,String m)
    {
           if (n>10 )
           {
               if (m.equals('Prabhav'))
               {
                   System.debug('n is between 10 and 100');
               }
               
           }
        else
        {
                System.debug('Out of Range');
        }
    }

}
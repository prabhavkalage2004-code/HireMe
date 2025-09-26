public class KeywordUse {
    
    final Integer x = 10;
    Public static void finalkeyword1()
    {
        
        Integer x = 20; 
        System.debug(x);
    }
    
    
      
    
    Public static void finalkeyword2()
    {
        final Integer y = 10;
         y = 20; 
        System.debug(y);
    }
    
    
    Public static void breakkeyword()
    {
        for (Integer i =1;i<=100;i++)
        {
            System.debug(i);
            if (i==5)
            {
                break;
            }

        }
    }
    
    
     Public static void continueyword()
    {
        for (Integer i =1;i<=10;i++)
        {
            if (i==5)
            {
                continue;
            }
            System.debug(i);
           
        }
    }
    
    
    
    
    

}
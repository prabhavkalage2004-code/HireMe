public class UseOfConstructor {
    
    public UseOfConstructor()
    {
        Integer n,a=4,b=8;
        n=a+b;
        System.debug(n);
    }
    
     Integer a;
     Integer b;
     public UseOfConstructor(Integer a,Integer b)
    {
        this.a=a;
        this.b=b;
       
    }
    public  void sumOfTwoNumber()
    {
        Integer n=a+b;
        System.debug(n);
    }
    
    

}
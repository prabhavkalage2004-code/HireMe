public class SwitchCaseClass {
    
    public void selectYourLang(integer option)
    {
        switch on(option)
        {
            When 1
            {
              System.debug('you have selected Marathi Language');  
            }
             When 2
            {
              System.debug('you have selected Hindi Language');  
            }
             When 3
            {
              System.debug('you have selected English Language');  
            }
             When Else
            {
              System.debug('Invalid option');  
            }
            
         }
    }

}
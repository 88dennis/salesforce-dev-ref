public class SOQLCLassTesting {
	
    public static void querySomething(){

    	List <Account> accAddressList = new List <Account>();
     
        
   
       accAddressList = [Select BillingAddress from Account where Name = 'GenePoint'];
        
        
        for(Account a : accAddressList) {
            System.debug(a);
        }


          
    
    }
}
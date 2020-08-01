public class ExceptionExample2 {

    public static void runner(){

        try {
         insertAccount();
        } catch (ExampleCustomException ece) {
            System.debug('Message : ' + ece.getMessage() );
            System.debug('Cause : ' + ece.getCause());
            System.debug('Line Number : ' + ece.getLineNumber());
        }
    }

    public static void insertAccount(){
        //CUSTOM EXCEPTION
        //-if you have more information to convey
        //you need to extend the Exception Class
        //the class name should end with the word Exception when you create your own exception
        try {
            Account a = new Account();
            insert a;
        } catch (DmlException de) {
            //the ExampleCustomException is a custome exception class; this class we created extends the Exception Class
            throw new ExampleCustomException('account cannot be created because the account name is missing', de);
        }
    }
}
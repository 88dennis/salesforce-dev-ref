public with sharing class ExceptionExample {
    public static void runner() {
        // try
        // Where you put your code that may or may not cause an exception
        // Catch block
        // Handles a particular exception
        System.debug('EXAMPLE EXCEPTIONS');
        ExceptionExample ee1 = new ExceptionExample();
        // ee1.exceptionSample1();
        // ee1.exceptionExampleList();
        // ee1.exceptionExampleNull();
        // ee1.exceptionExampleQuery();
        // ee1.exceptionExampleSObject();
        ee1.exceptionExampleDML();
    }

    public void exceptionSample1(){
        // lead l = new lead();
        // insert l;
        //this will throw a DMLExeption because inorder to create a lead record
        //there are 3 required fields
        // System.debug('trying to insert a record');
        //the code above should be inside a try-catch block
        try
        {
            // lead l = new lead();//WRONG
            lead l = new lead(LastName = 'Sarm', Company = 'Sarm Co');//CORRECT
            insert l;
        }
        catch(DmlException e)
        {
            System.debug('The following exeption has occurred ' +  e.getMessage());
        }
    }

    public void exceptionExampleList(){
        //trying to access an index that is not available
        //attempting to access an index that is out of bounds
        try {
            List<Integer> li = new List<Integer>();
            li.add(15);
            li.add(30);
            Integer first = li[0];
            Integer second = li[3];
            System.debug(first);
        } catch (ListException e) {
            System.debug('This is my List Exception ' + e.getMessage());
        }
        System.debug('trying to catch an exception');
    }

    public void exceptionExampleNull(){
        //deferencing a null variable
        // String s;
        // boolean b = s.contains('abc');
        // System.debug('s contains abc? ' + b );
        //this will throw a nullPointerException

        //put it inside a try block
        try {
            String s;
            boolean b = s.contains('abc');
            System.debug('s contains abc? ' + b);//if an exception occurs this line of code will not execute
        } catch (NullPointerException e) {
            //if your not sure with the exception you may use the Exception
            System.debug('null pointer exception example ' + e.getMessage());
        }
    }

    public void exceptionExampleQuery(){
        //any problems with SOQL queries
        //if you want to put no record or more than one record to a singleton sObject variable
        try {
            List <Lead> lm = [SELECT Name FROM Lead WHERE Name LIKE 'mike%'];
            System.debug('The size of the list is ' + lm.size());
            Lead l = [SELECT Name FROM Lead WHERE Name LIKE 'xyz%' LIMIT 1]; 
            System.debug(l);
        } catch (QueryException e) {
            System.debug(e.getMessage());
        }
    }

    public void exceptionExampleSObject(){
        try {
            //any problem with sObject records, such as attempting to change a field in an update statement
        Account a1 = new Account(Name='jeffrey cito'); //this will throw an exception because there is a required field
        insert a1;
        //fetch the object/record that we just created using the semi-colon on the a1 variable
        Account a2 = [SELECT Name, Description FROM Account WHERE Id = :a1.Id];
        //Trying to fetch the description without querying it above
        String str =  a2.Description; //this will result to an sObject exception because you are trying to fetch the Description directly
        //do not fetch the field directly. You should fetch it using an SOQL query first before you access it
        System.debug('fetched is ' + str);
        } catch (SObjectException soe) {
            System.debug(soe);
        }
    }

    public void exceptionExampleMethods(){
        try {
            lead l = [SELECT Name from LEAD LIMIT 1];
            String str = l.Description; //will throw an exception
        } catch (Exception e) {
            System.debug('Exception type caught: ' + e.getTypeName());
            System.debug('Cause: ' + e.getCause());
            System.debug('Line Number: ' + e.getLineNumber());
            System.debug('Stack Trace: ' + e.getStackTraceString());
        }
    } 

    public void exceptionExampleDML(){
        Account m1 = new Account(Name='coffeemaker', Description='kitchenware');
        Account m2 = new Account();
        Account m3 = new Account(); //this will not throw an exception yet because you are only instantiating it
        //exception will be there once you insert it
        List <Account> mList = new List<Account>();
        mList.add(m1);
        mList.add(m2);
        mList.add(m3);
        //instead of inserting each account one by one you can insert the whole list

        try {
          insert mList;
        } catch (DmlException e) {
            Integer numErrors = e.getNumDml();
            System.debug('the number of errors are ' + numErrors);
            for(Integer i = 0; i < numErrors; i ++){
                System.debug('getFieldNames ' + e.getDmlFieldNames(i));
                System.debug('getDmlMessage ' + e.getDmlMessage(i));
            }
        }
    }

    public void exceptionExampleMultiple(){
        try {
            Account acc = [SELECT Name FROM Account limit 1];
            String c = acc.site; //this will throw an exception because the Site was not fetched thru SOQL
        } catch (DmlException de) {
            System.debug(de.getMessage());
        } catch(SObjectException soe){
            System.debug(soe.getMessage());
        } catch(Exception e){
            //YOU CANNOT PUT THE GENERIC EXCEPTION AT THE TOP
            //THE SPECIFIC EXCEPTION SHOULD BE PLACED AT THE TOP
            System.debug(e.getMessage());
        }
        finally {
            System.debug('Closing the resources');
        }
    }

}
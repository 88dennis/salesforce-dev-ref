public with sharing class ExceptionExample {
    public static void runner() {
        // try
        // Where you put your code that may or may not cause an exception
        // Catch block
        // Handles a particular exception


        System.debug('EXAMPLE EXCEPTIONS');
        ExceptionExample ee1 = new ExceptionExample();
        // ee1.exceptionSample1();
        ee1.exceptionExampleList();


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

}

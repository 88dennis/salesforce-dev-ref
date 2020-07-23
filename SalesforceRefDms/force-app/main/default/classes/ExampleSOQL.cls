public with sharing class ExampleSOQL {
    

    public static void runner(){

        ExampleSOQL s = new ExampleSOQL();

        s.soqlQueries();

    }

    
    public void soqlQueries(){

        System.debug('SOQL QUERIES');
        //Basic Syntax
        //SELECT {field API Name List} from {Object API Name}
        System.debug([SELECT Name from Account]);

        //Querying Records from Standard Objects
        System.debug([SELECT Name from Account]);

        //Querying Records from Custom Objects
        System.debug('heloooooooooo'+ [SELECT Name from Student__c]);

        //Querying Multiple Fields
        System.debug([SELECT Name, AccountNumber from Account]);
        

    }

}

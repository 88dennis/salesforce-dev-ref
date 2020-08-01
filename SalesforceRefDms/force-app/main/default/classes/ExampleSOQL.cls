public with sharing class ExampleSOQL {
    

    public static void runner(){

        ExampleSOQL s = new ExampleSOQL();

        s.soqlQueries();

        s.soqlQueries2();

        s.soqlQueries3('Tim');

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

        //SELECT * from Account will NOT WORK

        //WHERE clause - after this keyword you define the condition
        //for multiple conditions you may use OR
        System.debug([SELECT Name FROM Account WHERE NumberofEmployees > 10 AND Rating = 'Hot']);
        System.debug([SELECT Name FROM Account WHERE Industry = 'Apparel']);

    }

    public void soqlQueries2(){

        //SOQL QUERIES returns a list of a particular sObject
        List<Account> accList;
        accList = [Select Name, NumberOfEmployees from Account];
        //For Loop
        for(Integer i = 0; i < accList.size(); i++){
            System.debug(accList[i].Name);
            System.debug(accList[i].NumberOfEmployees);
        }
        //For Each
        for(Account a : accList){
            System.debug(a.Name);
            System.debug(a.NumberOfEmployees);
        }
    }

    public void soqlQueries3(String str){

    //Static value 'John'
        List<Contact> contactList;
        contactList = [SELECT firstName, lastName, email FROM Contact WHERE firstName = 'John'];
        System.debug(contactList);

    //dynamic value variable str
        List<Contact> contactList2 = [SELECT firstName, lastName, email FROM Contact WHERE firstName = :str];
        System.debug(contactList2);
    }
}
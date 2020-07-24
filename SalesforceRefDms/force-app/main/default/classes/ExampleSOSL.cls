public with sharing class ExampleSOSL {
    
    public static void runner(){

        ExampleSOSL s = new ExampleSOSL();

        s.soslQueries();
        s.soslQueries2();


        // s.soslQueries2();


    }

    public void soslQueries(){

        System.debug('SOSL QUERIES');

        //In Apex:
            //FIND 'what' IN [What Type] Returning [WHERE];
            //

        //In Query Editor
            //FIND {what} [What Type] Returning [WHERE];

        //Example
            System.debug([Find 'Tim' Returning Contact]); //This will return ID
            System.debug([Find 'Tim' in All Fields Returning Account, Contact]); //This will return ID
            System.debug([Find 'John' in Email Fields Returning Contact]); //This will return ID
            // System.debug([Find 'John']); //This will return ID
        //RETURNING WHICH FIELDS
            System.debug([Find 'Tim' Returning Contact(LastName)]);
    }

    public void soslQueries2(){
        List<List<sObject>> l1 = [Find 'Tim' Returning Banker_Interaction__c]; 
        System.debug(l1);

        //Returning Specified Fields
        List<List<sObject>> l2 = [Find 'Tim' Returning Banker_Interaction__c(Name, Contact__c)]; 
        System.debug(l2);

        List<List<SObject>> l3 = [Find 'Rose' Returning Account(Name, NumberOfEmployees), Contact(Name, Phone)];
        System.debug(l3);

        List<Account> accList = l3[0];
        List<Contact> conList = l3[1];

        for(Account a : accList){
            System.debug(a.Name);
            System.debug(a.NumberOfEmployees);
        }

        for(Contact c : conList){
            System.debug(c.Name);
            System.debug(c.Phone);
        }
    }
}

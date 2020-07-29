public with sharing class ExampleTransaction {

    public static void runner(){

        ExampleTransaction et1 = new ExampleTransaction();
        et1.insertLeadAccount('dennisacct2', 'dennislead1', 'genCompany');

    }

    public void insertLeadAccount(String accName, String leadName, String leadCompany){
        //Setup -> object manager -> click a sObject
        // On the left click validation rules -> new
        // Rule name, Description
        // Insert a field where you want a validation rule to take effect
        //UPPER (Company) != 'DENNISCOMPANY - > this means that if company field value is not equal to DENNISCOMPANY it will send an error

        Account a1 = new Account(Name = accName);
        insert a1;

        Lead l1 = new Lead(LastName=leadName, Company=leadCompany);
        insert l1;
        //THIS L1 will throw a validation error

        Lead l2 = new Lead(LastName=leadName, Company='DennisCompany');
        insert l2;

        //in here we have 3 DML operations
    }
}

global class ExampleBatchApexUpdateContact implements Database.Batchable<SObject> {
    
    //The USE CASE is we want to update the mailing address of an Account Contact and make it similar to the Account Billing Address 
    //First we need to fetch all the Accounts and the fields we need using the START Method
    //the return type is Database.QueryLocator
    global Database.QueryLocator start(Database.BatchableContext bc)
    {
        return Database.getQueryLocator(
            //fetch the accounts with billing state = CA
            //fetch the contacts associated with these accounts

            'Select id,BillingStreet,BillingCity,BillingState,'+
            'BillingPostalCode,(Select id,MailingStreet,MailingCity,'+
            'MailingState,MailingPostalCode from Contacts) FROM Account '+
            'where BillingState=\'CA\''
            );

            //DONT FORGET TO QUERY THE FIELD YOU ARE GOING TO DO SOMETHING WITH
            //As shown above, the query includes CONTACTS
            // List <Account> acctList = new List<Account>();
            // acctList = [select name, BillingState,  from account];
            // for (Account a : acctList){
            // system.debug(a.Name);
            // system.debug(a.BillingState);
             // }

              // List <Account> acctList = new List<Account>();
            // List<Contact> contact1 = new List <Contact>();
            // acctList = [select name, BillingState,(select Name from contacts)  from account];
            // for (Account a : acctList){
            // for(Contact c: a.contacts){
            // system.debug(a.BillingState);
            // system.debug(a.Name);
            // system.debug(c.Name);
            // }

}   
            //TRY IN QUERY EDITOR, DEVELOPER CONSOLE:
            // Select id,BillingStreet,BillingCity,BillingState,BillingPostalCode,(Select id,MailingStreet,MailingCity,MailingState,MailingPostalCode from Contacts) FROM Account where BillingState='CA'Select id,BillingStreet,BillingCity,BillingState,BillingPostalCode,(Select id,MailingStreet,MailingCity,MailingState,MailingPostalCode from Contacts) FROM Account where BillingState='CA'
    
        //All the records from the start method will be passed to this execute method and stored in this list
    global void execute(Database.BatchableContext bc, List<Account> accts){

        //Create a variable where we can store the List of Contacts updated
        List<Contact> contacts1 = new List <Contact>();

        //iterate over the List of Account we got from the Start Method so we could update/edit each account

        for(Account acct : accts ){
            //for each of the accts we will go over the contacts
            
            for (Contact cont : acct.contacts){
                cont.MailingStreet = acct.BillingStreet;
                cont.MailingCity = acct.BillingCity;
                cont.MailingState = acct.BillingState;
                cont.MailingPostalCode = acct.BillingPostalCode;
                //add each contact to the contact list
                contacts1.add(cont);
            }
        }

        update contacts1;
    }

    global void finish(Database.BatchableContext bc) {

    }
}

//NOTE TO EXECUTE:
// ExampleBatchApexUpdateContact ucc = new ExampleBatchApexUpdateContact();

// Database.executeBatch(ucc);
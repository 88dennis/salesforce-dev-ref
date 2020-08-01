trigger ExampleTrigger5ContactBeforeDelete on Contact (before delete) {
    //throwing an error when user tries to delete a contact without an account
    
    //for the exiting contacts use trigger.old
    for(Contact c: Trigger.old ){
        if(c.AccountId == null){
            c.addError('hey you are not authorized to delete this contact');
        }
    }

}
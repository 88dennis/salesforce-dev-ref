trigger ExampleTrigger3 on Contact (before update) {
    //every time an existing contact is being updated you do something
    for (Contact c1 : Trigger.new){
        c1.Description = c1.lastName + ' contact was updated by DMS and this desctription text is created by an apex trigger by user ' + UserInfo.getUserName();
    }
}
trigger ExampleTrigger2 on Contact (before Insert) {
//for every contact that is created update the description
    for(Contact c1 : trigger.new){
        c1.description = c1.lastName + ' Contact is created by DMS';
    }
}
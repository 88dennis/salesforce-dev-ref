trigger ExampleTrigger on Contact (before insert) {
    // A code that gets executed before or after a record gets inserted
    // Trigger <nameOfTrigger> on (which object: Lead, Account, etc)  (event){} 
    // Events:
    // Before insert/ After insert
    // Before update/ after update
    // Before delete/ after delete
    // In Lightning: Setup->object manager->choose object-> triggers
    //In classic: setup-> build-> choose object-> triggers

    //IN THIS TRIGGER the use case is everytime we create a contact we will autofill the Description field
    

}
trigger ExampleTrigger4BeforeInsertUpdate on Contact (before insert, before update) {

    for(Contact c : Trigger.new){
        if(trigger.isInsert){
            c.description='Contact inserted/created successfully by insert trigger';

        } else if(trigger.isUpdate){
            c.description ='Contact updated by update trigger';
        }
    }
}
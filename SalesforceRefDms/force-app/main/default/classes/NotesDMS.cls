public with sharing class NotesDMS {
        public static void runner() {

        }

        //=========================QUERYING CONTACTS FROM ACCOUNTS===============================
        // public void contactFieldsConcat(Id accid){
        //     public  Id accountid;
        //     public  List<Account> lst_acc;
        //     accountid = accid;
                  
        // string query ='select id, name, (select id, name from Contacts) from account where id =: '+accountid;
        //         lst_acc = Database.query(query);
        //         system.debug(lst_acc);
        // }

        // The following queries should work

        // Using a semi-join:

        // SELECT Id, Name FROM Contact WHERE Id IN (SELECT ContactId FROM AccountContactRelation WHERE AccountId = <account Id here>)

        // Using a parent-child subquery

        // SELECT Id, (SELECT Contact.Name FROM AccountContactRelations) FROM Account WHERE Id = <account Id here>)
        //==================================================================
}
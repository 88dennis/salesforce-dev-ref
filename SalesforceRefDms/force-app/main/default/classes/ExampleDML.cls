public with sharing class ExampleDML {
   


    public static void runner(){

        ExampleDML dml1 = new ExampleDML();
        dml1.dmlStatements();
        //Insert Record Method
        // dml1.insertRecords();
        // dml1.fetchAndDeleteRecords();
        // dml1.fetchAndUpdateRecords();
        // dml1.fetchAndUpsertRecords();
        // dml1.fetchAndUndeleteRecords();

        //Read Records
        // dml1.readRecords();
    }

    public void dmlStatements(){
        System.debug('DML Statements');
        // insert - used to insert the records into the db
        // update - update the existing records in the db; or update the object; records only exists in objects; when you say object it is db
        // upsert - combination of update and insert; if no record in db it will auto insert; if there is a record it will update
        // delete - delete records
        // undelete - undelete records that were deleted; same with recyle bin
        // merge - merge different records together; where child is associated with parent record
        // Syntax
        // DML STATEMENT    sOBJECT or List Of sOBJECT

        //Account acc = new Account(Name='Peter');
       // insert acc;   
    }

    public void insertRecords(){
         //define a List
       List<Account> accList = new List<Account>();
       //for loop to dynamically create multiple (20) records
       for(Integer i = 0; i < 20; i++ ){
       //create 20 account records
        Account acc = new Account(Name='testAccount ' + i);
        //add each account record to your list
        accList.add(acc);
       }

       //after the loop is done executing the DML will excecute
       //insert and save your created LIST in the DB
       //if you dont DML statements, nothing will happen in the database
        insert accList;
    }

    public void readRecords(){
       List<Account> accList = new List<Account>();
        // accList = [Select Name, NumberOfEmployees from Account where Name Like 'testAccount%' order By Name];
        accList = [SELECT Name, NumberOfEmployees FROM Account WHERE Name LIKE '%Updated%' OR Name LIKE '%Upserted%'];

        System.debug('Result is ' + accList.size());
        System.debug(accList);
    }


    public void fetchAndDeleteRecords(){
         //DELETE THE LIST YOU CREATED
        List <Account> accList2 = new List<Account>();
        accList2 = [SELECT Name, NumberOfEmployees FROM Account WHERE Name LIKE '%Updated%' OR Name LIKE '%Upserted%'];
        System.debug(accList2);
        delete accList2;
    }


    public void fetchAndUpdateRecords(){
        //DELETE THE LIST YOU CREATED
     List <Account> accList = new List<Account>();
        accList =   [SELECT Name FROM Account WHERE Name LIKE '%testAccount%'];
        System.debug(accList);

        for(Account a : accList){
            a.Name = 'Updated ' + a.Name;
        }
     update accList;

    System.debug('updated accList ' + accList);
   }


   public void fetchAndUpsertRecords(){

    List <Account> accList = new List<Account>();
    accList = [Select Name, NumberOfEmployees from Account where Name Like 'Update%' order by Name];

    System.debug('the size is ' + accList.size());
    
    //we want to update existing accounts & at the sametime add new records to the account object
    for (Account a : accList){
            a.NumberOfEmployees = 100;
    }

    for( Integer i = 0; i < 5; i ++) {
        Account a2 = new Account(Name = 'Upserted test account ' + i);
        accList.add(a2);
    }
    upsert accList;

    accList = [SELECT Name FROM Account WHERE Name LIKE '%Updated%' OR Name LIKE '%Upserted%'];
    System.debug('accList ' + accList );
    System.debug('accList SIZE ' + accList.size() );

   }

   public void fetchAndUndeleteRecords(){
    List<Account> accList = new List<Account>();
    //REMEMBER TO PUT THE ALL ROWS KEY WORD TO ACCESS ALL THE DATA
    accList = [SELECT Name, NumberOfEmployees FROM Account WHERE Name LIKE '%Updated%' OR Name LIKE '%Upserted%' order by Name ALL ROWS ];
    //to check the recycle bin APPLAUNCHER --> view all -->  scroll below and check the list there's a recyle bin link
    undelete accList;
    accList = [SELECT Name, NumberOfEmployees FROM Account WHERE Name LIKE '%Updated%' OR Name LIKE '%Upserted%' order by Name ];
    System.debug(accList);
   }
}

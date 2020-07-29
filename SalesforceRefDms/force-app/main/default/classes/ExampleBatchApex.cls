global class ExampleBatchApex implements Database.Batchable<SObject>, Schedulable {
  //this should be global

  //start, execute and finish

  //start - initialize the records or data
  //execute - the operation you want to perform on the data

  //finish - gets executed at the end of the batch classes execution

  //the getQueryLocator method will get chunks of data
  global Database.QueryLocator start(Database.BatchableContext bc) 
  {
      return Database.getQueryLocator([Select AnnualRevenue from Lead]);
  }

  global void execute(Database.BatchableContext bc, List<Lead> list1) {

    for(Lead l : list1 ){
        if(l.annualRevenue == 1000000){
            l.annualRevenue = 2000000; 
        }
    }
    update list1;

  }

  global void finish(Database.BatchableContext bc)
  {
    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();

    String[] toAddress = new String[]{'dennissarmiento8080@gmail.com', 'dennissarmiento8080@gmail.com'};

    mail.setToAddresses(toAddress);
    mail.setSubject('Congratulations! Batch Completed');

    mail.setPlainTextBody('hey there ....');

    Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});
  }


  //to schedule a batch apex implement Schedulable
  //this is method overloading also
  global void execute(SchedulableContext sc)
  {
      ExampleBatchApex exb = new ExampleBatchApex();
      Database.executeBatch(exb);
  }

//setup --> Apex Classes --> click button "Schedule Apex"
//enter your job name (any name)
//choose this class
//to check it go to Jobs --> scheduled jobs

}


// NOTE:
//TO EXECUTE
// ExampleBatchApex exb = new ExampleBatchApex();
// Database.executeBatch(exb);

// ExampleBatchApex exb = new ExampleBatchApex();
// Database.executeBatch(exb);
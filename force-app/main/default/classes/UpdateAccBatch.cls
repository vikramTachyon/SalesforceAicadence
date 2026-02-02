global class UpdateAccBatch implements Database.Batchable<sObject> {

     global database.QueryLocator start(Database.batchableContext bc)
        {  
  
        String Accquary = 'SELECT Id, LastModifiedDate FROM Account where LastModifiedDate != LAST_N_DAYS : 60';
        return database.getQueryLocator(Accquary);
    }
     global void execute(Database.BatchableContext bc, list<Account> AccRecordstoProcess)
    
    {
        list<Account> updatedAcc = new list<Account>();
        for( Account Acc : AccRecordstoProcess)
        { 
           Acc.Active__c = 'True';
            
        }
       update updatedAcc;
        
    }
     global void finish(Database.BatchableContext bc){
    system.debug('Batch job Id is ...'+ bc.getJobId());
    AsyncApexJob jobdetails =[Select Id,status, totalJobitems, jobItemsprocessed, NumberOfErrors, createdBy.Email
                               From AsyncapexJob
                               where id =:bc.getJobId()];
    }

}
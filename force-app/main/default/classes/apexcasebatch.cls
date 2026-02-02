global  class apexcasebatch implements Database.Batchable<sObject>  {

     global database.QueryLocator start(Database.batchableContext bc)
        {  
  
        String casequary = 'SELECT Id, Status, Subject,   FROM Case';
        return database.getQueryLocator(casequary);
    }
     global void execute(Database.BatchableContext bc, list<Case> CaseRecordstoProcess)
    
    {
        list<Case> updatedCas = new list<Case>();
        for( Case cas : CaseRecordstoProcess)
        {
            cas.Status = 'open';
            cas.Subject = 'description from case';
            cas.Priority = 'Low';
            updatedCas.add(cas);
            
        }
       update updatedCas;
        
    }
     global void finish(Database.BatchableContext bc){
    system.debug('Batch job Id is ...'+ bc.getJobId());
    AsyncApexJob jobdetails =[Select Id,status, totalJobitems, jobItemsprocessed, NumberOfErrors, createdBy.Email
                               From AsyncapexJob
                               where id =:bc.getJobId()];
    }

}
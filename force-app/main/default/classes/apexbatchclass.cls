global  class apexbatchclass implements Database.Batchable<sObject>  {

     global database.QueryLocator start(Database.batchableContext bc)
        {  
        String escapedinput = 'vikram'+'%';
        String conquary ='SELECT Phone, Fax, Email FROM Contact WHERE Email != NULL AND Firstname Like \''+escapedinput+'\'';
        return database.getQueryLocator(conquary);
    }
     global void execute(Database.BatchableContext bc, list<Contact> contactRecordstoProcess)
    
    {
        list<Contact> updatedCon = new list<Contact>();
        for(Contact con : contactRecordstoProcess)
        {
            con.Description = 'this from apex batch';
            updatedCon.add(con);
            
        }
       update updatedCon;
        
    }
     global void finish(Database.BatchableContext bc){
    system.debug('Batch job Id is ...'+ bc.getJobId());
    AsyncApexJob jobdetails =[Select Id,status, totalJobitems, jobItemsprocessed, NumberOfErrors, createdBy.Email
                               From AsyncapexJob
                               where id =:bc.getJobId()];
    }

}
Global  class AccAnnRev implements DataBase.Batchable<sObject>, DataBase.Stateful {
    
    Decimal AccountAnnualRevenue = 0.0;
    
    Global DataBase.QueryLocator Start (Database.batchableContext bc)
        
    {
        
        String qry = 'SELECT Id, Name, AnnualRevenue FROM Account where AnnualRevenue != null';
        
        return DataBase.getQueryLocator(qry);
        
    }
    
    Global void Execute(DataBase.BatchableContext bc,list<sObject> AcAnRv)
        
    {
        
        if(!AcAnRv.IsEmpty())
            
        {
            
            For(sObject so: AcAnRv)
                
            {
                
                Account acc = (Account)so;
                
                AccountAnnualRevenue += acc.AnnualRevenue;
                
            }
            
        }
        
    }
    
    Global void Finish(DataBase.BatchableContext bc)
        
    {
        
        AsyncApexJob JobDetails = [Select Id,Status,TotalJobItems,JobItemsProcessed,NumberOfErrors,CreatedBy.Email
                                   
                                   From AsyncApexJob
                                   
                                   Where id =: bc.getJobId()];
        
        MessagingHelper.SendBatchJobNotificationEmail(jobDetails,'AccAnnRev',AccountAnnualRevenue);
        
    }
    
}
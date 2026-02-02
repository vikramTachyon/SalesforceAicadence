public class OpportunityschedulerJob implements Schedulable {

    public void execute(SchedulableContext sc) {

         List<Opportunity> opps = [SELECT Id, StageName, LastActivityDate, CloseDate, Archive_Reason__c, Description FROM Opportunity
            WHERE 
                (
                    (StageName = 'Proposal/Price Quote' 
                     AND LastActivityDate < :Date.today().addDays(-30)
                     AND CloseDate < :Date.today()
                    )
                 OR
                    (StageName IN ('Closed Lost','Closed Won') 
                     AND CloseDate < :Date.today().addYears(-2)
                    )
                )
        ];

        if (!opps.isEmpty()) {
            Opportunityschedule.processOpportunities(opps);
            update opps;
        }
    }
}
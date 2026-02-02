public class Opportunityschedule {

    public static void processOpportunities(List<Opportunity> lsOpp) {

        List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
 
        String adminEmail = 'vikramtagirisepu@gmail.com';

        for (Opportunity opp : lsOpp) {

            Boolean changed = false;
            if (opp.StageName == 'Proposal/Price Quote') {
                if (opp.LastActivityDate < Date.today().addDays(-30) &&
                    opp.CloseDate < Date.today()) 
                {
                    opp.StageName = 'Qualification';
                    opp.Description = 
                        'Auto reset by system due to inactivity from 30+ days';
                    changed = true;
                }
            }
 
            if (opp.StageName == 'Closed Lost' || opp.StageName == 'Closed Won') {
                if (opp.CloseDate < Date.today().addYears(-2)) {
                    opp.Archive_Reason__c = 'Auto archive (2+ years)';
                    changed = true;
                }
            }

             if (changed) {
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();

                mail.setToAddresses(new String[] { adminEmail });

                mail.setSubject('Opportunity Auto-Update Alert');
                mail.setPlainTextBody(
                    'The following Opportunity was updated by System Automation:' +
                    '\n\nName: ' + opp.Name +
                    '\nUpdated Stage: ' + opp.StageName +
                    '\nClose Date: ' + opp.CloseDate +
                    '\nReason: Automated Rule Applied.'
                );

                emails.add(mail);
            }
        }

        // Send all emails
        if (!emails.isEmpty()) {
            Messaging.sendEmail(emails);
        }
    }
}
public class RemovePIIBatch implements Database.Batchable<SObject> {
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT Id, Phone, Fax, Email__c, Closed_Date__c ' +
            'FROM Contact ' +
            'WHERE Closed_Date__c != NULL ' +
            'AND Closed_Date__c <= :System.today().addDays(-90)'
        );
    }

     public void execute(Database.BatchableContext bc, List<Contact> conList) {
        for (Contact c : conList) {
            c.Phone = null;
            c.Fax = null;
            c.Email= null;   // assuming Email__c is your custom email field
        }
        update conList;
    }

    // STEP 3: Finish message
    public void finish(Database.BatchableContext bc) {
        System.debug('PII removed for contacts older than 90 days.');
    }
}
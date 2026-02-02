public class HiringMQueueableApex implements System.Queueable {
    public void execute(System.QueueableContext qc) {
        // Create a Hiring Manager record
        Hiring_manger__c hr = new Hiring_manger__c();
        hr.Name = 'Sailendar';
        hr.Email__c = 'saliu@gmail.com';
        insert hr;

        // Chain the second Queueable class
        System.enqueueJob(new PositionQueueable(hr.Id));
    }
}
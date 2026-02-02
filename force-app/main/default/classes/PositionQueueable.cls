public class PositionQueueable implements System.Queueable {
    Id hiringManagerId;
    
    public PositionQueueable(Id hrId) {
        hiringManagerId = hrId;
    }
    
    public void execute(System.QueueableContext qc) {
        Position__c pos = new Position__c();
        pos.Name = 'Developer';
        pos.HiringManger__c = hiringManagerId;
        
        insert pos;
        
    }
}
public class CaseEscalationQueueable implements Queueable {
    Set<Id> contactIds;
    public CaseEscalationQueueable(Set<Id> cIds) {
        this.contactIds = cIds;
    }

    public void execute(QueueableContext qc) {
 
        List<Case> openCases = [SELECT Id, ContactId, Status, Priority FROM Case WHERE ContactId IN :contactIds AND Status != 'Closed' ];

        Map<Id, Integer> caseCountMap = new Map<Id, Integer>();

        for (Case c : openCases) {
            if (!caseCountMap.containsKey(c.ContactId)) {
                caseCountMap.put(c.ContactId, 0);
            }
            caseCountMap.put(c.ContactId, caseCountMap.get(c.ContactId) + 1);
        }
 
        List<Case> casesToUpdate = new List<Case>();

        for (Case c : openCases) {
            Integer count = caseCountMap.get(c.ContactId);

            if (count > 3) {
                c.Priority = 'High';
                c.Status   = 'Escalated';
                casesToUpdate.add(c);
            }
        }
 
        if (!casesToUpdate.isEmpty()) {
            update casesToUpdate;
        }
    }
}
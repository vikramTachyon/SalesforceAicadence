trigger triggerHM on Hiring_manger__c (before insert) {
    if(trigger.isbefore && trigger.isinsert ){
        for(Hiring_manger__c hm : trigger.new){
            if(hm.Location__c == null){
              hm.Location__c .addError('location is required');}}}

}
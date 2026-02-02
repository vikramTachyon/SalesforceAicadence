trigger Triggercase on Case (before insert , before update) {
    if(Trigger.isbefore && (Trigger.isinsert || Trigger.isupdate)){
        for (case cs : Trigger.new){
            if(cs.Origin == 'email'){
                cs.Status = 'new';
                cs.Priority = 'medium';}
            if(cs.Priority == 'high'){
                if(cs.AccountId == null){
                    cs.AccountId.addError('It should be associate with account');}
            }
             if(cs.ContactId == null){
                    cs.ContactId.adderror('it should be associated with related contact');
            }
        }
    }
    
}
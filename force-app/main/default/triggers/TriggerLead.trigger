trigger TriggerLead on Lead (before insert,before update) {
    if(trigger.isbefore && (trigger.isinsert || trigger.isupdate)){
        for (Lead ld : Trigger.new){
            if(ld.leadsource == 'web'){
                ld.rating = 'cold';
            }
            else {
                ld.rating = 'hot';
            }
        }
        for(Lead ld : Trigger.new){
            if(ld.industry == 'Banking'){
                if(ld.email == null){
                    ld.email.addError('email not be empty');
                }
                if(ld.phone == null){
                        ld.phone.addError('number can not be emorty');}}
        }
    }
}
trigger TriggerconMail on Contact (before insert,before update) {
    if (Trigger.isbefore && Trigger.isinsert){
        for(contact con : Trigger.new){
            if(con.Email == '' || con.Email ==null){
                con.Email.addError ('email should not be blank');}
        }
    }
    
    if(Trigger.isbefore && Trigger.isupdate){
        for(contact con : Trigger.new){
            contact cn = Trigger.oldmap.get(con.Id);
            if(con.Email == '' || con.Email ==null){
                con.Email.addError ('email should not be blank');}
            if(con.Email == cn.Email){
                    con.Email.addError('email should not be same');
                } 
            }
    }
}
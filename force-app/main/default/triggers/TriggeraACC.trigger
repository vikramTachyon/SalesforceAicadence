/*trigger TriggeraACC on Account (before insert,before Update,after insert,after update) {
     if(trigger.isbefore && (trigger.isinsert || trigger.isupdate)){
      for(account acc : Trigger.new){
            if(acc.Industry == '' || acc.Industry == null){
                acc.industry.addError('Industry not be empty');
            }
            if(acc.Fax == '' || acc.Fax == null){
                acc.fax.addError('fax cannot be empty');
            }
            if(acc.Rating == '' || acc.Rating == null){
                acc.Rating.addError('rating cannot be empty');
            }
        }
        if((trigger.isinsert || trigger.isupdate) && trigger.isafter){
            list<contact> lstcon = new  list<contact>();
            for(account acc : trigger.new){
                if (acc.No_of_Locations__c > 0 && acc.No_of_Locations__c != 0){
                    for(integer i=0;i <  acc.No_of_Locations__c; i++ ){
                        contact con = new contact();
                        con.lastname = acc.name + i;
                        con.Email = con.lastname+acc.email__c ;
                        con.AccountId = acc.Id;
                        lstcon.add(con);}   }
            }
            insert lstcon;
            
        }   
    }*/
    trigger TriggeraACC on Account (before insert,before Update,after insert,after update) {
    if((trigger.isinsert || trigger.isupdate) && trigger.isafter){
        list<contact> lstcon = new  list<contact>();
        for(account acc : trigger.new){
            if (acc.No_of_Locations__c > 0){
                for(integer i=0;i <  acc.No_of_Locations__c; i++ ){
                    contact con = new contact();
                    con.lastname = acc.name + i;

                    
                    con.Email = acc.Name + i + '@gmail.com';

                    con.AccountId = acc.Id;
                    lstcon.add(con);
                }
            }
        }
        insert lstcon;
    }   
}
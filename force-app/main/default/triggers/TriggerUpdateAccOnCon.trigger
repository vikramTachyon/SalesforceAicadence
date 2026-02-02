/*trigger TriggeraCon on Contact (before insert,before update) {
if(trigger.isbefore && (trigger.isinsert || trigger.isupdate)){
for(contact con : trigger.new){
if(con.email == ''){
con.email.adderror('email is mandatory');
}
if(con.phone == null){
con.phone.adderror('phone is mandatory');
}
}
}
}
trigger TriggeraCon on Contact (before insert,after update,after ){
if(trigger.isbefore && (trigger.isinsert || trigger.isupdate)){
list<Contact> lstcid = [SELECT Id, Name, Account.Id,Account.Name, Account.No_of_total_contact__c FROM Contact ];
account acc = new account();
acc.No_of_total_contact__c  = lstcid.size
for(contact con : trigger.new){
if(con.AccountId == null){
con.addError('it should be associated with related accoount');

if(con.LeadSource == 'web'){
con.addError('addres should not be empty');
//con.MailingAddress = con.MailingCity + con.MailingCountry + con.MailingStreet +con.MailingState+ con.MailingPostalCode;
}
}

}
}
}
trigger TriggeraCon on Contact (after insert,after update,after delete,after undelete){
    Set<Id> lstids = new Set<Id>();

    if(trigger.isinsert || trigger.isupdate || trigger.isundelete){
        for(Contact con : Trigger.new){
            if(con.AccountId != null){
                lstids.add(con.AccountId);
            }
        }
    }

    if(trigger.isdelete){
        for(Contact con : Trigger.old){
            if(con.AccountId != null){
                lstids.add(con.AccountId);
            }
        }
  Map<Id, Account> accMap = new Map<Id, Account>(
            [SELECT Id, Active__c FROM Account WHERE Id IN :lstids]
        );

       for(Contact con : Trigger.old){
            if(con.AccountId != null){
                Account acc = accMap.get(con.AccountId);
                if(acc != null && acc.Active__c == 'NO'){
                    con.addError('We cannot delete the Contact because its Account is Inactive.');
                }
            }
        }
    }
      
   List<Account> updAccList = new List<Account>();
   
    for(Id accId : lstids){
        List<Contact> lstcon = [SELECT Id FROM Contact WHERE AccountId = :accId];
        Account acc = new Account();
        acc.Id = accId;                      
        acc.No_of_total_contact__c = lstcon.size(); 
        updAccList.add(acc);
    }

     
        update updAccList;
    
}*/
trigger TriggerUpdateAccOnCon on Contact (after update) {

    Set<Id> accIds = new Set<Id>();

     for(Contact con : Trigger.new){
     //   Contact oldCon = Trigger.oldMap.get(con.Id);
 
            if(con.AccountId != null){
                accIds.add(con.AccountId);
            
        }
    }

    if(!accIds.isEmpty()){
        List<Account> acclist = [SELECT Id FROM Account WHERE Id IN :accIds];

         for(Account acc : acclist){
            acc.Name = acc.Name;   
        }

        update acclist;
    }
}
trigger TriggerRelatedAccCon on Account (before insert,before Update,after insert,after update) {
 if (Trigger.isAfter && Trigger.isInsert) {
        list<contact> lstcon = new list<contact> ();
        for(Account acc : trigger.new){
                 contact con = new contact();
                con.LastName = acc.Name;
                con.Phone  = acc.Phone;
                con.Email = acc.email__c;
                con.AccountId = acc.Id;
                lstcon.add(con);
                
                       update lstcon;
            
        }
    update lstcon;
 }
   /*     list<Contact> lstoinsert = new list<Contact>();

        for(Account acc :trigger.new){

            if (acc.No_of_Locations__c != null && acc.No_of_Locations__c > 0) {

                for (Integer i = 0; i < acc.No_of_Locations__c; i++) {

                    Contact cs = new Contact(); 

                        cs.LastName = acc.Name + 'from loop ' + (i + 1);

                        cs.Phone = acc.Phone;

                        cs.Email = acc.Email__c;

                        cs.AccountId = acc.Id;

                        lstoinsert.add(cs);

                }

                }

        }

               if (!lstoinsert.isEmpty()) {

                     insert lstoinsert;

            }
 
    
    
}
}*/
 }
public class CreateHM {
    public static void InsertHM(){
list<Hiring_manger__c> lstHm = new list<Hiring_manger__c>();
        for (integer i = 0;i <= 9;i++){
         Hiring_manger__c Hm = new Hiring_manger__c();
         Hm.Name__c = 'Tagirisepu' + i;
         Hm.Email__c = 'vikram@gmail.com';
         Hm.Location__c = 'Hyderbad';
         lstHm.add(Hm);
         }
    insert (lstHm);

     }
 }
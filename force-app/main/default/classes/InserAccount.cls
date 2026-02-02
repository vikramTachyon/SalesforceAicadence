public class InserAccount {
    public static void createAccount(){
    Account acc = new Account(); 
    acc.Name = 'Tagirsepu';
    acc.AccountNumber = '96754989';
    insert acc;
    list<contact> lstrcon = new list<contact>();  
        for (integer i = 0; i <= 9; i++){
    contact c = new Contact() ;
    c.FirstName = 'Vinay'+ i;
    c.LastName = ' Tagirisepu';
    c.AccountId = acc.Id;
    lstrcon.add(c);
         }
    insert (lstrcon);


    
    
    
    
    }

}
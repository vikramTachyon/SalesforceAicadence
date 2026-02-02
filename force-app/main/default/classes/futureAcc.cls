public class futureAcc {
    public static Id getuserlastname(){
        user u = [SELECT Id ,name FROM User where name like 'vikram%' ];
        return u.Id;
    }
   // @future
    public static void acc(Id userid){
        Account acc = new account();
        acc.description = 'updated from future method';
        acc.Name = 'uday22';
        acc.AccountNumber = '898989899';
        insert acc;
    }
    
}
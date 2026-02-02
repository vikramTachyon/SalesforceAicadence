public class AccountHandler {
    public static Account insertNewAccount(String accName) {
        try {
            Account acc = new Account();
            acc.name = accName;
            
            insert acc;
            return acc; // return the inserted record
        } catch (DmlException e) {
            return null; // return null if insert fails
        }
    }
}
public class dummy {
    @invocableMethod(label ='Flow APEx')
    public static list<Account> accdetails(){
        list<Account> lstacc = [SELECT Name, Id, Industry, AnnualRevenue, Rating FROM Account];
        system.debug(lstacc);
        return lstacc;
    }

}
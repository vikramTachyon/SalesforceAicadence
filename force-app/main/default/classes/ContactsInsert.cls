public class ContactsInsert {
    public static void CreateContact(){
    Contact con = new Contact();
    con.FirstName = 'VIkram';
    con.LastName = 'TAgirisepu';
    con.Department = 'ECE';
    insert con;
    System.debug('contact isnserted succesfully' +con);
    }
}
public class ContactRecordAssign {
public static void ContactCreation(String FName, String LName, String mail){
    
    contact cn = new contact();
    cn.FirstName = FName;
    cn.LastName = LName;
    cn.Email = mail;
    insert cn;
}
}
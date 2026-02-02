public class leadRecordAssign {
public static void leadCreation(String FName, String LName, String LSource, String statuss, String mail, String comp){
    
    Lead ld = new Lead();
    ld.FirstName = FName;
    ld.LastName = LName;
    ld.Company = comp;
    ld.LeadSource = LSource;
    ld.Status = statuss;
    ld.Email = mail;
    
    insert ld;
}
}
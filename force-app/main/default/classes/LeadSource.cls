public class LeadSource {
    public static void InsertLeadSource(){
        Lead leadRecord = new Lead();
        leadRecord.FirstName = 'Vikram';
        leadRecord.LastName = 'Tagirisepu';
        leadRecord.Company = 'Vikram Technologies';
        leadRecord.Email = 'vikram@gmail.com';
        leadRecord.Phone = '9876543210';
        leadRecord.City = 'Bangalore';
system.debug('lead source inserted sucessfully'+leadRecord);
}
}
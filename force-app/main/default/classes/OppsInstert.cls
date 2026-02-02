public class OppsInstert {  
        public static void InSertOpportunity() {
        Opportunity opp = new Opportunity();
        opp.Name = 'Project  Deal';
        opp.CloseDate = Date.today(); 
        opp.StageName = 'Closed Won';      
        opp.Amount = 50000;             
        insert opp;
        
        System.debug('Opportunity Created Successfully! Id: ' + opp.Id);
    }
}
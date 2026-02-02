public class TopOpportunitiesAgentAction {

    // ===== INPUT WRAPPER =====
    public class TopOppInput {
        @InvocableVariable(label='Account Name')
        public String accountName;

        @InvocableVariable(label='Account Rating')
        public String rating;
    }

    // ===== OUTPUT WRAPPER =====
    public class TopOppOutput {
        @InvocableVariable
        public List<Opportunity> opportunities;
    }

    // ===== INVOCABLE METHOD =====
    @InvocableMethod(label='Get Top Opportunities')
    public static List<TopOppOutput> getTopOpps(List<TopOppInput> inputs) {

        TopOppInput input = inputs[0];
        List<Opportunity> opps = new List<Opportunity>();

        // NORMAL LOGIC: Account Name
        if (String.isNotBlank(input.accountName)) {

            List<Account> accs = [
                SELECT Id
                FROM Account
                WHERE Name = :input.accountName
                LIMIT 1
            ];

            if (!accs.isEmpty()) {
                opps = [
                    SELECT Id, Name, Amount, StageName
                    FROM Opportunity
                    WHERE AccountId = :accs[0].Id
                    ORDER BY Amount DESC
                    LIMIT 5
                ];
            }
        }

        // FALLBACK LOGIC: Rating
        if (opps.isEmpty() && String.isNotBlank(input.rating)) {
            opps = [
                SELECT Id, Name, Amount, StageName
                FROM Opportunity
                WHERE Account.Rating = :input.rating
                ORDER BY Amount DESC
                LIMIT 5
            ];
        }

        TopOppOutput output = new TopOppOutput();
        output.opportunities = opps;

        return new List<TopOppOutput>{ output };
    }
}
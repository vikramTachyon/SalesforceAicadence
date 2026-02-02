/*trigger triggeroppassign on Opportunity (before insert,before update,before delete) {
if(trigger.isbefore  && (trigger.isinsert || trigger.isupdate)){
Date futureDate = Date.today().addDays(30);

for(opportunity opp : Trigger.new){
opp.name = opp.Name + futureDate;
if(opp.StageName == 'PerceptionAnalysis' || opp.StageName == 'Proposal/price Quote' || opp.StageName == 'Negotition/Review'){
opp.Probability = 75;
opp.CloseDate =  Date.today().addDays(30); 

}
if(opp.StageName == 'closed won '){
opp.Probability = 100;
opp.Description = 'congratulation '+ opp.OwnerId+' we have own the opportunity with amount ' + opp.Amount;
}
if(opp.StageName == 'id decision makers' && opp.Probability >= 75){o

opp.addError('we cannot delete the opportunity ,high chance of loosing opportunity' );
}}}

}*/
trigger triggerOppAssign on Opportunity (before insert, before update, before delete) {
    
    
    
    if (Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)) {
        
        Date futureDate = Date.today().addDays(30);
        
        for (Opportunity opp : Trigger.new) {
             
            if (Trigger.isInsert) {
                opp.Name = opp.Name + '_' + futureDate.format();
            }
            
          
            if (opp.StageName == 'Perception Analysis' ||
                opp.StageName == 'Proposal/Price Quote' ||
                opp.StageName == 'Negotiation/Review') {
                    
                    opp.Probability = 75;
                    opp.CloseDate = Date.today().addDays(30);
                }
            
 
            if (opp.StageName == 'Closed Won') {
                opp.Probability = 100;
                opp.Description = 
                    'Congratulations ' + opp.OwnerId + 
                    '! We have won the opportunity with amount ' + opp.Amount;
            }
        }
    }

if (Trigger.isBefore && Trigger.isDelete) {
    for (Opportunity opp : Trigger.old) {
        if (opp.StageName == 'closed won' && opp.Probability >= 75) {
            opp.addError('We cannot delete the opportunity, high chance of losing it.');
        }
    }
    return;
}
}
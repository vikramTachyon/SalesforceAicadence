trigger TriggerOpp on Opportunity (before insert,after insert,after update,before update) {
    if((trigger.isinsert || trigger.isupdate)&&  trigger.isbefore){

/*list<Opportunity> lstop =[select avg(amount) from opportunity ];
if(trigger.isinsert || trigger.isupdate || trigger.is)
    for(Opportunity opp : Trigger.new){
    }    
    }*/
        Opportunityschedule.processOpportunities(Trigger.new);}}
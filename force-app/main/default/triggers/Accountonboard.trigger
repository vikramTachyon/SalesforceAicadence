trigger Accountonboard on Account (after insert) {
    if(Trigger.isafter && Trigger.isinsert){
      List<on_boarding_case__c> acclst = new List<on_boarding_case__c>();
        for(account acc : Trigger.new){
            if(acc.Type == 'customer - Direct'){
               on_boarding_case__c bc = new on_boarding_case__c();
               bc.Account__c = acc.Id;
               acclst.add(bc);
               
}
}
insert acclst;

}

}
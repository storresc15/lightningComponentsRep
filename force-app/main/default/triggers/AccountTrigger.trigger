trigger AccountTrigger on Account (before insert, after insert) {
    
    if(trigger.isAfter) {
        
            AccountClass.identicalContacts(trigger.new);
        	AccountClass.createOpps(Trigger.new);
    } 

}
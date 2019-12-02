trigger LeadTrigger on Lead (before insert, before update, after insert, after update, after delete) {
    
    if(trigger.isBefore) {
        if(trigger.isInsert) {
            AccountClass.createFromLead(trigger.new);
            LeadClass.keyFieldPopulate(trigger.new);
        }
        if(trigger.isupdate) {
            LeadClass.keyFieldPopulate(trigger.new);
        }
    }
    if(trigger.isAfter) {
        if(trigger.isInsert) {
           LeadClass.createCheckTasks(trigger.new);
           LeadClass.validateTest(Trigger.new); 
        }
        if(trigger.isupdate) {
            LeadClass.createCheckTasks(trigger.new);
            LeadClass.validateTest(Trigger.new); 
            LeadTasksClass.completedTask(Trigger.new);
        }
    }
}
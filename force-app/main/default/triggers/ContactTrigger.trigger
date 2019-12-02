trigger ContactTrigger on Contact (before insert, before delete, after insert, after update, after delete) {
    
    if(trigger.isBefore) {
        if(trigger.isInsert){
         ContactClass.emailChange(trigger.new);   
        }
    }
    if(trigger.isAfter) {
        if(trigger.isInsert) {
         ContactClass.updateCreatedThisYear(trigger.new);   
        }
        if(trigger.isUpdate) {
         ContactClass.updateCreatedThisYear(trigger.new);   
        }
        if(trigger.isDelete) {
         ContactClass.updateCreatedThisYear(trigger.old);   
        }
    }

}
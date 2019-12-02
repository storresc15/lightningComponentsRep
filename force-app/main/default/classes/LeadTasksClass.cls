public class LeadTasksClass {

    public static void completedTask(list<lead> leads) {
        task[] taskToUpdate = new list<task>();
        set<ID> leadSet = new set<ID>();
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        
        for(lead l: leads){
            if(l.Status == 'Closed - Converted' || l.Status == 'Closed - Not Converted') leadSet.add(l.Id);
        }
        
        task[] tasks = [SELECT ID, subject, status FROM TASK WHERE WhoID in: leadSet];
        
        for(task t : tasks) {
            t.status = 'Completed';
            taskToUpdate.add(t);
        }
        
        update taskToUpdate;

		String[] toAddresses = new String[] {'sebas.torres.88@gmail.com'};

        mail.setToAddresses(toAddresses);    
        mail.setSenderDisplayName('Salesforce Support');
        mail.setSubject('Your Tasks have been updated to closed');
        mail.setPlainTextBody('Your Case: ' + case.Id +' has been created.');
        mail.setHtmlBody('Your Tasks have been closed! </b>has been created.<p>'+
     'To view your case <a href=https://yourInstance.salesforce.com/'+case.Id+'>click here.</a>');
        
        
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        
    }
    
}
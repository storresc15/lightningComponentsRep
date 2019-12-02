public class LeadClass {
    
    public static void keyFieldPopulate(list<lead> leads) {
     
        lead[] leadstoUpdate = new list<lead>();
        integer countKey = 0;
        
        for(lead l: leads) {
            if(!l.Bypass_Triggers__c) {
            countKey = 0;
            if(l.firstname != null) countKey ++;
            if(l.lastname != null) countKey ++;
            if(l.email != null) countKey ++;
            if(l.Phone != null) countKey ++;
            if(l.Website != null) countKey ++;
            if(l.Title != null) countKey ++;
            
            l.Key_Fields_Populated__c = countKey;
            leadstoUpdate.add(l);
            }
        }
    }
    
    public static void createCheckTasks(list<lead> leads) {
        
        task[] tasks = new list<task>();
        
        for(lead l: leads) {
            
            if(!l.Bypass_Triggers__c) {
            
            if(l.Key_Fields_Populated__c >= 3) {
                //Go field by field and create the task accordingly, then add the task to the list in order to bulkify
                if(l.FirstName != null) {
                    task t = new task(subject = 'Verify the First Name field', whoId = l.Id);
                    tasks.add(t);
                }
                if(l.lastName != null) {
                    task t = new task(subject = 'Verify the Last Name field', whoId = l.Id);
                    tasks.add(t);
                }
                if(l.email != null) {
                    task t = new task(subject = 'Verify the Email field', whoId = l.Id);
                    tasks.add(t);
                }
                if(l.phone != null) {
                    task t = new task(subject = 'Verify the Phone field', whoId = l.Id);
                    tasks.add(t);
                }
                if(l.website != null) {
                    task t = new task(subject = 'Verify the Website field', whoId = l.Id);
                    tasks.add(t);
                }
                if(l.title != null) {
                    task t = new task(subject = 'Verify the Title field', whoId = l.Id);
                    tasks.add(t);
                }
                
            }
            }
        }
        insert tasks;
        
    }
    
    //Validate 'TEST' Method
    public static void validateTest(list<lead> leads){
        task[] tasks = new list<task>();
        
        String[] fieldList = new List<String>();
        boolean containsTest = false;
        
        for(lead l: leads) {
            
            if(!l.Bypass_Triggers__c) {
            
            fieldList.clear();
            containsTest = false;
            if(l.firstName != null && l.FirstName.toLowerCase().contains('test')){
                containsTest = true;
                fieldList.add('First Name');
            }
            if(l.lastName != null && l.lastName.toLowerCase().contains('test')){
                containsTest = true;
                fieldList.add('Last Name');
            }
            if(l.Email != null && l.email.toLowerCase().contains('test')){
                containsTest = true;
                fieldList.add('Email');
            }
            if(l.phone != null && l.phone.toLowerCase().contains('test')){
                containsTest = true;
                fieldList.add('Phone');
            }
            if(l.website != null && l.website.toLowerCase().contains('test')){
                containsTest = true;
                fieldList.add('Website');
            }
            if(l.title != null && l.title.toLowerCase().contains('test')){
                containsTest = true;
                fieldList.add('Title');
            }
            //Add the tasks
            if(containsTest) {
                Task t = new task(subject = 'WARNING!', Description = 'This Lead contains the TEST keyword in the following key fields: ' + fieldList, whoId = l.Id);
                tasks.add(t);
            }
            }  
        }
        
        insert tasks;
        
    }
    
    
    

}
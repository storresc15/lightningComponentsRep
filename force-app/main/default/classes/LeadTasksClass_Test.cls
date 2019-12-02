@isTest
public class LeadTasksClass_Test {
    
    @isTest public static void mainTest() {
        
        lead[] testLeads = new list<lead>();
        
        lead l1 = new lead(firstname ='Test', lastname ='lead', Company = 'Test Company');
        testLeads.add(l1);
        
        Lead l2 = new lead(firstname ='Test2', lastname ='lead2', Company = 'Test Company', Title = 'New Title', Email = 'sebas.torres.88@gmail.com', phone = '2325345334', website = 'Testwebsite.com');
        testLeads.add(l2);
        
        lead l3 = new lead(firstname ='Test', lastname ='lead', Company = 'Test Company', Title = 'New Title', Email = 'sebas.torres.88@gmail.com', Bypass_Triggers__c = true);
        testLeads.add(l3);
        
        
        insert testLeads;
        
        lead testLead = [SELECT ID, FirstName, Status FROM LEAD WHERE firstName = 'Test2'];
        testLead.Status = 'Closed - Converted';
        
        test.startTest();
        update testLead;
        test.stopTest();
        
        task [] testTasks = [SELECT ID, Status FROM TASK WHERE Status  = 'Completed'];
        
        system.assert(testTasks.size() > 0);
        
    }

}
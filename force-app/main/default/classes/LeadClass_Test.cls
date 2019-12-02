@isTest
public class LeadClass_Test {

    @isTest public static void mainLeadTest() {
        
        lead[] testLeads = new list<lead>();
        
        lead l1 = new lead(firstname ='Test', lastname ='lead', Company = 'Test Company');
        testLeads.add(l1);
        
        Lead l2 = new lead(firstname ='Test2', lastname ='lead2', Company = 'Test Company', Title = 'New Title', Email = 'sebas.torres.88@gmail.com', phone = '2325345334', website = 'Testwebsite.com');
        testLeads.add(l2);
        
        lead l3 = new lead(firstname ='Test', lastname ='lead', Company = 'Test Company', Title = 'New Title', Email = 'sebas.torres.88@gmail.com', Bypass_Triggers__c = true);
        testLeads.add(l3);
        
        test.startTest();
        insert testLeads;
        test.stopTest();
        
        lead t1 = [SELECT ID, FIRSTNAME, Key_Fields_Populated__c FROM LEAD WHERE FIRSTNAME = 'TEST' LIMIT 1];
        lead t2 = [SELECT ID, FIRSTNAME, Key_Fields_Populated__c FROM LEAD WHERE FIRSTNAME = 'TEST2' LIMIT 1];
        
        system.assertEquals(T1.Key_Fields_Populated__c, 2);
        system.assertEquals(T2.Key_Fields_Populated__c, 6);
        
        Task[] myT = [SELECT ID FROM Task];
        
        system.assert(myT.size() > 4);
        
       	t1.Email = 'sebas.torres.88test@gmail.com';
        t1.Title = 'test';
        t1.Phone = '5427test';
        t1.LastName = 'Test';
        
        update t1;
        
    }
    
}
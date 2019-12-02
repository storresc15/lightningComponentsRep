@isTest
public class AccountClass_Test {
    
    @isTest public static void mainTest() {
        
        lead[] myLeads = new list<lead>();
        lead l1 = new lead(lastName = 'Test', Company = 'Test1', status = 'Open - Not Contacted');
        lead l2 = new lead(lastName = 'Test2', Company = 'Test2', status = 'Open - Not Contacted');
        
        myLeads.add(l1);
        myLeads.add(l2);
        
        test.startTest();
        upsert myLeads;
        test.stopTest();
        
        Account[] accs = [Select ID, Name FROM Account];
        Contact[] cons = [SELECT ID, LastName FROM Contact];
        
        system.assert(accs.size() > 1);
        system.assert(cons.size() > 1);
        
    }
    
    @isTest public static void oppCreateTest() {
        
        Account[] accs = new list<Account>();
        
        for(integer i = 0; i < 10; i ++) {
            Account a = new Account(name = 'Test', numberofEmployees = 100);
            accs.add(a);
        }
        test.startTest();
        insert accs;
        test.stopTest();
        
        Opportunity[] opps = [SELECT ID, NAME FROM opportunity];
        
        System.assert(opps.size() > 20);
    }
    
}
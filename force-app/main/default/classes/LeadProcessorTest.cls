@isTest
public class LeadProcessorTest {

    @testSetup 
    static void setup() {
        List<Lead> leads = new List<Lead>();
        
        // insert 10 Leads
        for (Integer i=0;i<10;i++) {
            leads.add(new lead(LastName= 'test'+i, Company = 'TestComp'));
        }
        insert leads;
    }
    
    
    static testmethod void test() {        
        Test.startTest();
        LeadProcessor uca = new LeadProcessor();
        Id batchId = Database.executeBatch(uca);
        Test.stopTest();
        // after the testing stops, assert records were updated properly
        System.assertEquals(10, [select count() from lead where LeadSource = 'Dreamforce']);
    }
    
}
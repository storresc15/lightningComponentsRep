@isTest
public class AccountProcessorTest {
    
    @isTest public static void accUpdateTest() {
        
        Account a1 = new Account(Name = 'test1');
        insert a1;
        Account a2 = new Account(Name = 'test2');
        insert a2;
        
        Contact[] listofCns= new list<Contact>();
        
        for (integer i = 0; i < 5; i++) {
            contact c1 = new contact(LastName = 'Test'+i, AccountID = a1.id);
            listofCns.add(c1);
            contact c2 = new contact(LastName = 'Test'+i, AccountID = a2.Id);
            listofCns.add(c2);
        }
        
        insert listofCns;
        
        test.startTest();
        
        ID[] theIDs = new list<ID>();
        theIDs.add(a1.id);
        theIDs.add(a2.Id);
        
        AccountProcessor.countContacts(theIDs);
        
        test.stopTest();
        
        
        system.debug('Number for a1: '+ a1.Number_of_Contacts__c);
        system.debug('Number for a2: '+ a2.Number_of_Contacts__c);
    }

}
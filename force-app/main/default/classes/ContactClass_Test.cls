@isTest
public class ContactClass_Test {
    
    @isTest public static void mainTest() {
        
        Account a = new Account(name = 'TestAcc');
        insert a;
        
        contact[] myConTest = new list<contact>();
        contact c = new contact(lastName = 'Test1', Phone = '53658754', AccountID = a.Id);
        contact c2 = new contact(lastName = 'Test2');
        
        myConTest.add(c);
        myConTest.add(c2);
        
        
        ContactClass.emailChange(myConTest);
        
        test.startTest();
        insert myConTest;
        test.stopTest();
        
        contact ctest = [SELECT ID, NAME, EMAIL FROM CONTACT WHERE LASTNAME = 'Test1' LIMIT 1];
        
        system.assertEquals('hello@world.com', ctest.Email);
        
        
    }
    
    @isTest public static void testUpdate(){
        Account a = new Account(name = 'TestAcc');
        insert a;
        
        contact[] myConTest = new list<contact>();
        contact c = new contact(lastName = 'Test1', Phone = '53658754', AccountID = a.Id);
        contact c2 = new contact(lastName = 'Test2');
       
        myConTest.add(c);
        myConTest.add(c2);
        
        insert myConTest;
        
        Contact c1 = [SELECT ID, NAME,Phone, AccountID FROM CONTACT WHERE lastname = 'Test2' LIMIT 1];
        c1.Phone = '56867234';
        c1.AccountId = a.id;
        
        test.startTest();
        update c1;
        test.stopTest();
        
        Account a1 = [SELECT ID, NAME,Contacts_Created_This_Year__c from Account LIMIT 1];
        system.assert(a1.Contacts_Created_This_Year__c == 2);
        
    }
    
    @isTest public static void testDelete(){
        Account a = new Account(name = 'TestAcc');
        insert a;
        
        contact[] myConTest = new list<contact>();
        contact c = new contact(lastName = 'Test1', Phone = '53658754', AccountID = a.Id);
        contact c2 = new contact(lastName = 'Test2');
        
        myConTest.add(c);
        myConTest.add(c2);
        
        insert myConTest;
        
        Contact c1 = [SELECT ID, NAME,Phone, AccountID FROM CONTACT WHERE lastname = 'Test2' LIMIT 1];
        c1.Phone = '56867234';
        c1.AccountId = a.id;
        
        test.startTest();
        delete c1;
        test.stopTest();
        
        Account a1 = [SELECT ID, NAME,Contacts_Created_This_Year__c from Account LIMIT 1];
        system.assert(a1.Contacts_Created_This_Year__c != 2);
        
    }
    
}
@isTest

public class ContactSearch_Test {
    
    @isTest public static void testContact() {
        
        contact[] listOfCons = new list<contact>();
        for(integer i = 0; i < 10; i++) {
            contact c = new contact(lastname = 'Testcon', MailingPostalCode = '66045');
            listOfCons.add(c);
        }
        
        insert listOfCons;
        
        test.startTest();
        
        Contact[] myList = ContactSearch.searchForContacts('Testcon', '66045');
        
        test.stopTest();
        
        system.assert(myList.size() > 2);
        
    }

}
@isTest

public class RandomContactFactory_Test {

    @isTest public static void testFactory() {
        
        test.startTest();
        
        Contact[] cons = RandomContactFactory.generateRandomContacts(10, 'Test');
        
        test.stopTest();
        
        system.assert(cons.size() == 10);
        system.assertEquals('Test0', cons[0].lastName);
        
    }
}
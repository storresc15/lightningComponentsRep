@isTest

public class Test_AccountHandler {
    
    @isTest public static void testhandler1() {
        
        test.startTest();
        AccountHandler.insertNewAccount('Test Acc');
        AccountHandler.insertNewAccount('');
        test.stopTest();
        
        Account[] myAccs = [SELECT ID, Name FROM Account];
        
        system.assert(myAccs.size() == 1);
    }

}
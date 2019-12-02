@isTest
public class CreateOppty_Test {
    
    @isTest public static void createOpp() {
        
        case c = new Case(status = 'new', origin = 'Phone');
        
        insert c;
        
        test.startTest();
        
        Opportunity o = CreateOppty.newOppty('NameOpp', c.id);
        
        test.stopTest();
        
        system.assert(o.name == 'NameOpp');
        system.assert(o.accountid == null);
    }

}
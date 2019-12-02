@isTest
public class TowerMapControllerClassTest {
    
    @isTest public static void towerCheck() {
        
        Account a = new Account(name = 'Utha');
        insert a;
        
        tower__c [] towerList = new list<tower__c>();
        
        for(integer i = 0; i < 5; i++) {
            tower__c t = new tower__c(name = 'test'+i, state__c = a.id);
     		towerList.add(t);
        }
        
        insert towerList;
        
        test.startTest();
        
        List<Tower__c> allTowers = TowerMapControllerClass.getAllTowers();
        
        test.stopTest();
        
        system.assert(allTowers.size() > 2);
        
    }

}
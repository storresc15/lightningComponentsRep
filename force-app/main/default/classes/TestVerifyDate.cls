@isTest
public class TestVerifyDate {
    
    @isTest public static void testVer1() {
        
    Date myDate = Date.newInstance(2019, 2, 17);
    Date newDate = mydate.addDays(30);

       test.startTest();
        
       Date finalDate = VerifyDate.CheckDates(myDate, newDate);
        
       test.stopTest();
        
        
        system.assert(finalDate < newDate);
    }
    
    @isTest public static void testVer2() {
        
    Date myDate = Date.newInstance(2019, 2, 17);
    Date newDate = mydate.addDays(3);

       test.startTest();
        
       Date finalDate = VerifyDate.CheckDates(myDate, newDate);
        
       test.stopTest();
        
        
        system.assert(finalDate == newDate);
    }

}
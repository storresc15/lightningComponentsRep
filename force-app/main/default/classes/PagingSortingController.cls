public class PagingSortingController {
    @AuraEnabled public static List<Account> getAccounts() {
        return [SELECT Name, Industry, AnnualRevenue FROM Account LIMIT 1000];
    }
} 
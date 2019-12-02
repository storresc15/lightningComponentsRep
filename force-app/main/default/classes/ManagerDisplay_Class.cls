public with sharing class ManagerDisplay_Class {
	@AuraEnabled    
    public static List<Contact> getDirectReports(String contactId) {
        
        return [SELECT ID, FirstName, LastNAME, AccountId, Email FROM Contact WHERE ReportsToId =:contactId ];
        
    }

    
    @AuraEnabled    
    public static Integer getTotal(String contactId) {
        
        return [SELECT ID, FirstName, LastNAME, AccountId, Email FROM Contact WHERE ReportsToId =:contactId ].size();
        
    }
}
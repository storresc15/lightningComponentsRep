public with sharing class dataTableController {
    @AuraEnabled
    public static List<Contact> getContacts() {
        List<Contact> contacts = 
                [SELECT Id, Name, Phone, Email FROM Contact Limit 10];
        return contacts;
    }
}
public class ContactSearch {

    @AuraEnabled
    public static list<contact> searchForContacts(String lastN, String postal) {
        
        contact[] myList = [SELECT ID, firstname, lastname, MailingPostalCode FROM contact WHERE lastname = :lastN AND MailingPostalCode =:postal];
        
        return myList;
    }
    @AuraEnabled
    public static List<Contact> getContactList(String searchTerm){
        String term = '%' + searchTerm + '%';
        contact[] myList = [SELECT ID, firstname, lastname, MailingPostalCode FROM contact WHERE lastname = :searchTerm];
        
        return myList;
    }
}
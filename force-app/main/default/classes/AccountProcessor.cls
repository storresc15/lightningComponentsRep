public class AccountProcessor {
    
    @future 
    public static void countContacts(list<ID> ids) {
        
       List<Account> accToUpdate = new list<account>();
        List<Account> listAcc=[select id,Number_of_Contacts__c,(Select id from Contacts)from Account where id in:ids];
        for(account a:listAcc){
            a.Number_of_Contacts__c = a.contacts.size();
            accToUpdate.add(a);
        }
        update accToUpdate;
    }
        
        
 }
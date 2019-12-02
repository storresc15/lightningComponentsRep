public class ContactClass {

    public static void emailChange(list<Contact> conList) {
        
        Contact[] contactsToUpdate = new list<Contact> ();
        for(contact c: conList){
         c.Email = 'hello@world.com';
         contactsToUpdate.add(c);   
        }
       
    }
    
    public static void updateCreatedThisYear(list<contact> conList) {
        
        Set<Id> acctIds = new Set<Id>();
        Date yearDate = date.today().addDays(-365);
        
        for (Contact c : conList) {
     //yes, you can have a contact without an account
        if (c.AccountId != null) {
            acctIds.add(c.AccountId);
        }
    }
   
    List<Account> acctsToRollup = new List<Account>();
    
    //****** Here is the Aggregate query...don't count in loops, let the DB do it for you*****
    for (AggregateResult ar : [SELECT AccountId AcctId, Count(id) ContactCount 
                               FROM Contact 
                               WHERE AccountId in: acctIds
                               AND Phone != null
                               AND CreatedDate >= :yearDate
                               GROUP BY AccountId]){
        Account a = new Account();
        a.Id = (Id) ar.get('AcctId'); //---> handy trick for updates, set the id and update
        a.Contacts_Created_This_Year__c = (Integer) ar.get('ContactCount');
        acctsToRollup.add(a);
    }
    
    //----> probably you'll want to do a little more error handling than this...but this should work. 
    system.debug('The accounts to be updated are: ' + acctsToRollup);
    update acctsToRollup;
        
    }
    
}
public class AccountClass {

    public static void createFromLead(list<lead> leads) {
        Account[] accs = new list<Account>();
        
        for(lead l: leads){
            account a = new account(name = l.LastName);
            accs.add(a);
        }
        upsert accs;
    }
    
    public static void identicalContacts(list<account> myAccs) {
        Contact[] cons = new list<Contact>();
        for(account a: myAccs) {
            Contact c = new Contact(LastName = 'ConCreated', AccountID = a.Id);
            Contact c2 = new Contact(LastName = 'ConCreated', AccountID = a.Id);
            cons.add(c);
            cons.add(c2);
        }
        upsert cons;
    }
    
    public static void createOpps(list<account> myAccs) {
        Opportunity[] opps = new List<Opportunity>();
        for(account a: myAccs) {
            if(a.NumberOfEmployees >= 90) {
                for(integer i = 0; i < 10; i++){
                    Opportunity o = new Opportunity(Name = 'TestOpp' + i, StageName = 'Prospecting', CloseDate = Date.today(), AccountId = a.Id);
                    opps.add(o);
                }
            }
        }
        
        insert opps;
        
    }
    
}
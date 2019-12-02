public class RandomContactFactory {
    
    public static list<Contact> generateRandomContacts(integer numOfCons, String lastN) {
        
        Contact[] cons = new list<Contact>();
        
        for(integer i = 0; i < numOfCons; i++) {
            Contact c = new Contact(LastName = lastN + i);
            cons.add(c);
            
        }
        
        return cons;
    }

}
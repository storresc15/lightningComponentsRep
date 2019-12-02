public class AccountHandler {
    
    public static account insertNewAccount(string accName) {
        
        account a = new account(name = accName);
        
        try {
            insert a;
        } catch(DMLException ex) {
            system.debug('The Name is missing, remember this field is required!');
            return null;
        }
        
        return a;
    }

}
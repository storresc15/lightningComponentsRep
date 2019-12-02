public class returnMAPController {

    @AuraEnabled
    
   public static map<String,List<sObject>> getMap(){
        
  Map<String,List<sObject>> Mymap = new Map<String,List<sObject>>();
        
        List<Account> acclist= [select id, name from Account Limit 10];
        
        List<Contact> conlist=[select id, name from Contact Limit 10];
        
        List<Product2> prodlist=[select id, name from Product2 Limit 10];
        
    Mymap.put('RecentAccounts',acclist);
        
  Mymap.put('RecentContacts',conlist);
        
    Mymap.put('RecentProducts',prodlist);
        
  return Mymap;
}
}
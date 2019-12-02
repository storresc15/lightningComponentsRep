public class wrapperDisplayController {
    
    @AuraEnabled
    public static wrapperClass getData(){
        // create a wrapper class object 
        wrapperClass objWraprCls = new  wrapperClass (); 
        
        // set the wrapper class @AuraEnabled properties and return it to the lightning component
        objWraprCls.Contlist = [SELECT firstName, LastName, Department,LeadSource from contact];
        objWraprCls.countContacts = objWraprCls.Contlist.size(); 
        objWraprCls.headerMsg = 'Display Contacts using Wrapper Class';
        return objWraprCls;    
    }
    
    // wrapper class with @AuraEnabled {get;set;} properties   
    public class wrapperClass{
        @AuraEnabled public List<contact> Contlist{get;set;}
        @AuraEnabled public Integer countContacts{get;set;}
        @AuraEnabled public String headerMsg {get;set;}
    }
}
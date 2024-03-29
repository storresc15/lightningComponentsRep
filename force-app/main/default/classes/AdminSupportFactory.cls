/**
 * Book Name	- 	Apex Design Pattern
 * Chapter 2	-	Factory Method Pattern 
 * 
 * This factory class is used to instantiate concrete class 
 * of respective support type
 * */
public class AdminSupportFactory {
    
    public static IAdminSupport getInstance(String supporttype)
    {
        
        /*
         * Using Reflection
         
        //Read Custom setting to get actual class name on basis of Support type
        Support_Type__c supportTypeInfo = Support_Type__c.getValues(supporttype);
        
        //from custom setting get appropriate class name
        Type t = Type.forName(supportTypeInfo.Class_Name__c);
        
		IAdminSupport retVal = (IAdminSupport)t.newInstance();
        return retVal;
		*/
        
        
        IAdminSupport support = null; 
        
        if(supporttype == 'AdminBasic')
        {
            support = new AdminBasicSupportImpl(); 
            
        }else if(supporttype == 'AdminPremier')
        {
            support = new AdminPremiumSupportImpl(); 
            
        }
		return support ;
		
        
    } 
}
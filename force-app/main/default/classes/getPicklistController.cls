public class getPicklistController {
    
 @AuraEnabled
 public static List <String> getPickListOptions(sObject sobj, string fieldname) {
 
  List <String> optionList = new list < String > ();
  
  Schema.sObjectType objType = sobj.getSObjectType();
 
  Schema.DescribeSObjectResult objDescribe = objType.getDescribe();
  
  map <String, Schema.SObjectField> fieldMap = objDescribe.fields.getMap();
 
  list <Schema.PicklistEntry> values = fieldMap.get(fieldname).getDescribe().getPickListValues();
 
  for (Schema.PicklistEntry a: values) {
   optionList.add(a.getValue());
  }
     
  return optionList;
 }
}
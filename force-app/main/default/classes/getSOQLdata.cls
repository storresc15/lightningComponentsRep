public class getSOQLdata {

 @AuraEnabled
 public static List<Account> getAccountWithContact() {
  List<Account> acclist = [select Name, AnnualRevenue, (select Name from contacts) from Account LIMIT 10];
  return acclist;
 }
}
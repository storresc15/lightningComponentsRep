public class SendMyMailsController {
 @AuraEnabled 
    public static void sendMyemail(String sendToList ,String subject ,String body){
    
      List<Messaging.SingleEmailMessage> MyemailList =  new List<Messaging.SingleEmailMessage>();     
  
    
       Messaging.SingleEmailMessage myMail = new Messaging.SingleEmailMessage();
    
   
       List<String> sendList = new List<String>();
        
       sendList.add(sendToList);
        
       myMail.setToAddresses(sendList);
       
       myMail.setReplyTo('sebas.torres.88@gmail.com');
        
       myMail.setSenderDisplayName('PAAA Leaders'); 
    
       myMail.setSubject(subject);
        
       myMail.setHtmlBody(body);
     
       MyemailList.add(myMail);
    
       Messaging.sendEmail(MyemailList);
   }   
}
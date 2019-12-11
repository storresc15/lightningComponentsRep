public class downloadCSVController {
    
@AuraEnabled
   public static list <product2> getProducts(){
      
     List <Product2> productList =[SELECT Name,ProductCode,isActive From Product2 LIMIT 1000];
        
     return productList;
   }
}
public class SelectProducts {
    
    
    @AuraEnabled
    public static List<WrapperToDisplayProductRecords> getProductRecords() {
         List<WrapperToDisplayProductRecords> lstProdRecords = new List<WrapperToDisplayProductRecords>();
         List<Product2> prodList =  [SELECT Id, Name,ProductCode FROM Product2];
         
        if(prodList != null && prodList.size() > 0){
            
        
          for(Product2 prod : prodList){
                
                WrapperToDisplayProductRecords prodRecord = 
        new WrapperToDisplayProductRecords();
                prodRecord.productId = prod.Id;
                prodRecord.productName = prod.Name;
                prodRecord.ProductCode = prod.ProductCode;
                prodRecord.product = prod;
                lstProdRecords.add(prodRecord);
            }
            
        }
        return lstProdRecords;

    }
    
     @AuraEnabled
    public static void performAction(string prodRecords) {
        
        if(!string.isBlank(prodRecords)){
            List<WrapperToDisplayProductRecords> lstProdRecords = 
      (List<WrapperToDisplayProductRecords>)
      System.JSON.deserialize(prodRecords,List<WrapperToDisplayProductRecords>.class);
            
            //Perform Operation with records 
            for(WrapperToDisplayProductRecords objProdRecords:lstProdRecords)
            {
                if(objProdRecords.isSelected)
                {
                    // delete the record
                    delete objProdRecords.product;
                }
            }
            
            
        }
    
    }
    
    /*******************************************/
    /* Wrapper class to display Products      */
    /*****************************************/
    
    public class WrapperToDisplayProductRecords {
        
        @AuraEnabled public boolean isSelected {get;set;}
        @AuraEnabled public string productName {get;set;}
        @AuraEnabled public string ProductCode {get;set;}
        @AuraEnabled public string productId {get;set;}
        Product2 product {get;set;}
        
        public WrapperToDisplayProductRecords(){
            isSelected = false;
            productName = '';
            ProductCode = '';
        }
    }


}
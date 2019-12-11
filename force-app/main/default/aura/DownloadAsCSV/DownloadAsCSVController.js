({
    
    doinit: function(component, event, helper){
       var action = component.get('c.getProducts');
      action.setCallback(this, function(response){
   	  var state = response.getState();
         if (state === "SUCCESS") {
              component.set('v.ProductList', response.getReturnValue());
         }
      });
      $A.enqueueAction(action);
    },
    
    
    downloadAsCSV : function(component,event,helper){
        
        
        var TableData = component.get("v.ProductList");
        
        var csvData = helper.returnStringForCSV(component,TableData);   
             
        if (csvData == null){return;} 
        
        
	     var hiddenElement = document.createElement('a');
         hiddenElement.href = 'data:text/csv;charset=utf-8,' + encodeURI(csvData);
         hiddenElement.target = '_self';
         hiddenElement.download = 'ProductCSV.csv'; // saving file with name 'ProductCSV'   
         document.body.appendChild(hiddenElement);
         hiddenElement.click(); 
       }, 
 })
({
    doInit : function(component, event, helper) {
        helper.getProducts(component);
    },
    
    doSomething : function(component, event, helper) {
        
        var lstProducts = component.get("v.lstProd");
        
        //To check if list is not empty or null
        if(!$A.util.isEmpty(lstProducts) && !$A.util.isUndefined(lstProducts)){
            
            //Calling the Apex Function
            var action = component.get("c.performAction");
                                  
            //Json Encode to send the data to Apex Class
            var productRecords = JSON.stringify(lstProducts);
            //Setting the Apex Parameter
            action.setParams({
                prodRecords : productRecords
            });
            
            //Setting the Callback
            action.setCallback(this,function(a){
                //get the response state
                var state = a.getState();
                
                //check if result is successfull
                if(state == "SUCCESS"){
                    
                    //Perform Action after the result
                    alert('Success in calling server side action');
                    
                } else if(state == "ERROR"){
                    alert('Error in calling server side action');
                }
            });
            
            //adds the server-side action to the queue        
            $A.enqueueAction(action);
            
        }
        
        
    }
})
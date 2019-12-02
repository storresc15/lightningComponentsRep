({
	getEmployees  : function(component, event, helper) {
        var empId = component.get("v.recordId");
        
		var action = component.get("c.getDirectReports");
        action.setParams({
           contactId : empId
        });
        action.setCallback(this, function(response){
            var state = response.getState();
           
            if (component.isValid() && state === "SUCCESS") {
           
               
                component.set("v.items", response.getReturnValue());
                 
            }
        });
        
        var action2 = component.get("c.getTotal");
        action2.setParams({
           contactId : empId
        });
        action2.setCallback(this, function(response){
            var state = response.getState();
           
            if (component.isValid() && state === "SUCCESS") {
           
               
                component.set("v.totalEmployees", response.getReturnValue());
                 
            }
        });
        
        $A.enqueueAction(action);
        $A.enqueueAction(action2);
	}
})
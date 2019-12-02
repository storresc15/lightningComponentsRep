({
    doInit: function(component, event, helper) {
    
     var action = component.get('c.getMap');
     action.setCallback(this,function(response){
        var state = response.getState();
        if (state === "SUCCESS") {
        component.set('v.Map',response.getReturnValue());
           
     }
  });
     $A.enqueueAction(action);
  },
   
  })
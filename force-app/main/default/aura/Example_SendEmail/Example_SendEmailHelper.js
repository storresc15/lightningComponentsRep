({
    sendHelper: function(component, getEmail, getSubject, getbody) {
        	
        var action = component.get("c.sendMyemail");
         
        action.setParams({
            'sendToList': getEmail,
            'subject': getSubject,
            'body': getbody
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var storeResponse = response.getReturnValue();
                     component.set("v.mailStatus", "true");
            }
 
        });
        $A.enqueueAction(action);
    },
})
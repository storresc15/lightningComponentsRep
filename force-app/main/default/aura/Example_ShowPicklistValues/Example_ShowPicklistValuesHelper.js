({
    fetchPickListVal: function(component, fieldname) {
        var action = component.get("c.getPickListOptions");
        action.setParams({
            "sobj": component.get("v.objInfo"),
            "fieldname": fieldname
        });
        
        var options = [];
        
        action.setCallback(this, function(response) {
            if (response.getState() === "SUCCESS") {
                var receivedValues = response.getReturnValue();
 
                if (receivedValues != undefined && receivedValues.length > 0) {
                    options.push({
                        label: "-- None --",
                        value: ""
                    });
                }
                for (var i = 0; i < receivedValues.length; i++) {
                    options.push({
                        label: receivedValues[i],
                        value: receivedValues[i]
                    });
                }
                component.set("v.options", options);
            }
        });
        $A.enqueueAction(action);
    },
})
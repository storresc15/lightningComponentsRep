({
	doInit: function(component, event, helper) {
        var action = component.get("c.getAccounts");
        action.setCallback(this, function(result) {
            var records = result.getReturnValue();
            component.set("v.allAccounts", records);
            component.set("v.maxPage", Math.floor((records.length+9)/10));
            helper.renderPage(component);
        });
        $A.enqueueAction(action);
	},
   
    renderPage: function(component, event, helper) {
        helper.renderPage(component);
    },
})
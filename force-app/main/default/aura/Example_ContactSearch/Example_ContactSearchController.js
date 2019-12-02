({
	doSearch : function(component, event, helper) {
        
        // make a server side call to fetch list of contact 
    
        var action = component.get("c.getContactList");
        action.setParams({ searchTerm : component.get("v.searchTerm") });

        // Create a callback that is executed after 
        // the server-side action returns
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                
                var contacts = response.getReturnValue();
                
                // step 1
                var searchCompleteEvent = component.getEvent("contactSearchComplete");
				// step 2
                searchCompleteEvent.setParams({ contacts: contacts});
				// step 3
                searchCompleteEvent.fire(); 
           	 }
			});
       $A.enqueueAction(action);
}

})
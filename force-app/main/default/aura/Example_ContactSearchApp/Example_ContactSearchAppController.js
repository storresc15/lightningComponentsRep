({
	handlingSearchEvent : function(component, event, helper) {
        
        var contactList=event.getParam("contacts");
        component.set("v.appContacts", contactList);
		component.set("v.showTable","true");
	}
})

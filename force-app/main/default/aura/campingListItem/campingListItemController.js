({
	packItem : function(component, event, helper) {
        let button = event.getSource();
        if("v.item.Packed__c" != true){
           component.set("v.item.Packed__c", true);
           button.set('v.disabled',true);
        } 
        
	}
})
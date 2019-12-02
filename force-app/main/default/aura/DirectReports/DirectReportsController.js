({
	fetchCons : function(component, event, helper) {
        var empId = component.get("v.recordId");
        
        component.set('v.mycolumns', [
            {label: 'First Name', fieldName: 'linkName', type: 'url', 
            typeAttributes: {label: { fieldName: 'FirstName' }, target: '_blank'}},
            {label: 'Last Name', fieldName: 'LastName', type: 'text'},
            {label: 'Account', fieldName: 'AccountID', type: 'text'},
            {label: 'Email', fieldName: 'Email', type: 'Text'}
        ]);
        var action = component.get("c.getDirectReports");
        action.setParams({
           contactId : empId
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                var records =response.getReturnValue();
                records.forEach(function(record){
                    record.linkName = '/'+record.Id;
                });
                component.set("v.conList", records);
            }
        });
        $A.enqueueAction(action);
    }


})
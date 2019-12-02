({
    doInit: function(component, event, helper) {
        helper.fetchPickListVal(component, 'Industry');
    },
    onChange: function(component, event, helper) {
        alert(event.getSource().get("v.value"));
    },
})
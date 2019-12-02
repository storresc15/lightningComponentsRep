({

    navigate : function(component, event, helper) {

         var address = component.find("address").get("v.myURL");

        var urlEvent = $A.get("e.force:navigateToURL");

       urlEvent.setParams({

"url": 'https://developer.salesforce.com/trailheadx/' + address

    });

    urlEvent.fire();

    }

})
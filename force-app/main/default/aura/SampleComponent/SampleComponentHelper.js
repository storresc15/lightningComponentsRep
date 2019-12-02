({
    getResponse: function(component, base) {
        // create a server side action.       
        var action = component.get("c.getCalloutResponseContents");
        //Add conversion
        var convert = component.get("v.convertionNumber");
        // set the url parameter for getCalloutResponseContents method (to use as endPoint) 
        action.setParams({
            "url": 'http://data.fixer.io/api/latest?access_key=8a31270dcf21bc8993b57ea28f81c9ce&symbols=USD,AUD,CAD,PLN,MXN'
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (component.isValid() && state === "SUCCESS") {
                // set the response(return Map<String,object>) to response attribute.      
                component.set("v.response", response.getReturnValue());
 
                // get the all rates from map by using key              
                var getAllRates = component.get("v.response")['rates'];
                var CurrencyList = [];
                var ConvertedList = [];
                var tempNum = 0;
                // play a loop on rates object 
                for (var key in getAllRates) {
                    tempNum = getAllRates[key] * convert;
                    // push all rates with there Name in CurrencyList variable.        
                    CurrencyList.push(key + ' $' + getAllRates[key]);// i.e : INR = 67.919
                    ConvertedList.push('To ' + key + ' : ' + tempNum );
                }
                // set the CurrencyList to ListOfCurrency attribute on component.           
                component.set("v.ListOfCurrency", CurrencyList);
                component.set("v.ConvertedList", ConvertedList);
            }
        });
 
        $A.enqueueAction(action);
    },
})
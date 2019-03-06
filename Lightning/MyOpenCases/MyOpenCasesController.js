({
	doInit : function(component, event, helper) {
		console.log('doInit is starting');
        
        console.log('here');
        var getMyOpenCases = component.get("c.getMyOpenCases");
        
        getMyOpenCases.setCallback(this, function(response) {
            var state = response.getState();
            
            if (component.isValid() && state === "SUCCESS") {
                console.log('Getting Cases');
                console.log('cases: ' + response.getReturnValue());
                
                component.set("v.cases", response.getReturnValue());
            } else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log('Error message: ' + errors[0].message);
                    }
                }
            } else {
                console.log('Unknown error');
            }
        });
        
        $A.enqueueAction(getMyOpenCases);
	},
})
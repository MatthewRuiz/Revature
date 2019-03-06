({
    saveCase : function(component, event, helper) {
        var newCase = component.get("v.newCase");
        
        var action = component.get("c.newCaseDB");
        action.setParams({
            "caseObj" : newCase,
            "contactId" : component.get("v.recordId")
        });
        
        action.setCallback(this, function(response) {
            var state = response.getState();
            
            if (component.isValid() && state === "SUCCESS") {
                console.log('Save success: ' + response.getReturnValue());
                
                var caseEvent = $A.get("e.c:CaseCreatedEvent");
                
                console.log('accountId: ' + response.getReturnValue());
                
                caseEvent.setParams({
                    "accountId" : response.getReturnValue() 
                });
                
                caseEvent.fire();
                
            } else if (state === "ERROR") {
                console.log('Problem saving case, response state: ' + state);
            } else {
                console.log('Unknown problem, response state: ' + state);
            }
        });
        
        $A.enqueueAction(action);
    }
})
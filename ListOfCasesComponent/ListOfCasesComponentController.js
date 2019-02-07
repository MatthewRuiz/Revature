({
	doInit : function(component, event, helper) {
        component.set('v.columns', [
            {label: 'Case Number', fieldName: 'CaseNumber', type: 'text'},
            {label: 'Subject', fieldName: 'Subject', type: 'text'},
            {label: 'Status', fieldName: 'Status', type: 'text'},
            {label: 'Priority', fieldName: 'Priority', type: 'text'}
        ]);
        
        var getCasesAction = component.get("c.getCases");
        getCasesAction.setParams({"priority" : component.get("v.priority")});
        
        getCasesAction.setCallback(this, function(response) {
            var state = response.getState();
            
            if (component.isValid() && state === "SUCCESS") {
                component.set("v.data", response.getReturnValue());
            } else {
                console.log('Server call failed');
            }
        });
        
        $A.enqueueAction(getCasesAction);
	},
    
    handlePriorityChangeEvent : function(component, event, helper) {
        console.log('Handling Priority Change Event');
        
        var newPriority = event.getParam("priority");
        
        component.set("v.priority", newPriority);
        
        var getCasesAction = component.get("c.getCases");
        getCasesAction.setParams({"priority" : component.get("v.priority")});
        
        getCasesAction.setCallback(this, function(response) {
            var state = response.getState();
            
            if (component.isValid() && state === "SUCCESS") {
                component.set("v.data", response.getReturnValue());
            } else {
                console.log('Server call failed');
            }
        });
        
        $A.enqueueAction(getCasesAction);
    }
})
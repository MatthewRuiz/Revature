({
	priorityChange : function(component, event, helper) {
		console.log('Firing Priority Change');
        
        var newPriority = component.get("v.priority");
        console.log('newPriority: ' + newPriority);
        
        var cmpEvent = component.getEvent("priorityEventChange");
        
        cmpEvent.setParams({
            priority : newPriority
        });
        cmpEvent.fire();
	}
})
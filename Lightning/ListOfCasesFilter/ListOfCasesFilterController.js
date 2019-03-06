({
	priorityChange : function(component, event, helper) {
		console.log('Firing Priorty CHange Event');
        
        var newPriority = component.get("v.priority");
        
        var cmpEvent = component.getEvent("priorityChangeEvent");
        
        cmpEvent.setParams({
            "priority" : newPriority
        });
        cmpEvent.fire();
	}
})
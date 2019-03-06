({
    doInit : function(component, event, helper) {
        // Prepare a new record from template
        component.find("opportunityRecordCreator").getNewRecord(
            "Opportunity",  	// sObject Type (objectApiName)
            null,			// recordTypeId
            true, 			// skip cache?
            null 			// callback
        );
    },
    
    saveOpportunity : function(component, event, helper) {
        
        // Sets contact AccountId
        component.set("v.simpleNewOpportunity.AccountId", component.get("v.recordId"));
        
        // Save Contact
        component.find("opportunityRecordCreator").saveRecord(function(saveResult) {
            var state = saveResult.state;
            
            if (component.isValid() && state === "SUCCESS") {
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Saved",
                    "message": "The record was saved."
                });
                toastEvent.fire();
                
                // Clear component record
                component.find("opportunityRecordCreator").getNewRecord(
                    "Opportunity",  	// sObject Type (objectApiName)
                    null,			// recordTypeId
                    true, 			// skip cache?
                    null 			// callback
                );
            } else {
                component.set("v.newOpportunityError", "Error saving opportunity.");
            }
        })
    },
})
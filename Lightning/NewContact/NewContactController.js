({
    doInit : function(component, event, helper) {
        // Prepare a new record from template
        component.find("contactRecordCreator").getNewRecord(
            "Contact",  	// sObject Type (objectApiName)
            null,			// recordTypeId
            true, 			// skip cache?
            null 			// callback
        );
    },
    
    saveContact : function(component, event, helper) {
        
        // Sets contact AccountId
        component.set("v.simpleNewContact.AccountId", component.get("v.recordId"));
        
        // Save Contact
        component.find("contactRecordCreator").saveRecord(function(saveResult) {
            var state = saveResult.state;
            
            if (component.isValid() && state === "SUCCESS") {
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Saved",
                    "message": "The record was saved."
                });
                toastEvent.fire();
                
                // Clear component record
                component.find("contactRecordCreator").getNewRecord(
                    "Contact",  	// sObject Type (objectApiName)
                    null,			// recordTypeId
                    true, 			// skip cache?
                    null 			// callback
                );
            } else {
                component.set("v.newContactError", "Error saving contact.");
            }
        })
    },
})
({
    doInit : function(component, event, helper) {
       var a = component.get("c.process");
       $A.enqueueAction(a);
    },

   process : function(component, event, helper) {
       var heightFeet = parseInt(component.get("v.heightFeet"));
       var heightInches = parseInt(component.get("v.heightInches"));

       if (isNaN(heightInches)) { heightInches = 0; }

       var totalInches = (heightFeet * 12) + heightInches;

       var heightInCentimeters = helper.inchesToCentimeters(totalInches);
       component.set("v.heightInCentimeters", heightInCentimeters);

       var heightInMeters = helper.inchesToMeters(totalInches);
       component.set("v.heightInMeters", heightInMeters);
   }
})
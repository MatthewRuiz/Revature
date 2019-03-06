({
   doInit : function(component, event, helper) {
       var a = component.get("c.process");
       $A.enqueueAction(a);
   },

   process : function(component, event, helper) {
       var dateOfBirth = new Date(component.get("v.dateOfBirth"));
       var today = new Date();
       var years = helper.inYears(dateOfBirth, today);
       component.set("v.years", years);

       var months = helper.inMonths(dateOfBirth, today);
       component.set("v.months", months);

       var weeks = helper.inWeeks(dateOfBirth, today);
       component.set("v.weeks", weeks);

       var days = helper.inDays(dateOfBirth, today);
       component.set("v.days", days);
   }
})
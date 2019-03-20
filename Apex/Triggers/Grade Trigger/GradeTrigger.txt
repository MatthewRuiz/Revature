trigger GradeTrigger on Grade__c (before insert) {
    if (Trigger.isBefore) {
        if(Trigger.isInsert) {
            CreateGradeHandler.preventDuplicateGrades(Trigger.new);
        }
    }
}
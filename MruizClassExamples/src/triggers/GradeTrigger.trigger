trigger GradeTrigger on Grade__c (after insert) {
    if (Trigger.isInsert && Trigger.isAfter) {
        CreateGradeHandler.preventDuplicateGrades(Trigger.new);
    }
}
trigger ClassEnrollmentTrigger on ClassEnrollment__c (after insert) {
    if(Trigger.isAfter) {
        if(Trigger.isInsert) {
            CreateGradeHandler.createGradesForClassEnrollments(Trigger.new);
        }
    }
}
trigger AssessmentTrigger on Asessment__c (after insert) {
    if (Trigger.isAfter) {
        if(Trigger.isInsert) {
            CreateGradeHandler.createGradesForAssessments(Trigger.new);
        }
    }
}
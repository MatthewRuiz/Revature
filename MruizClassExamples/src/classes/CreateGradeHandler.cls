public class CreateGradeHandler {
    public static void preventDuplicateGrades(List<Grade__c> grades) {

		ID classOfGradeFromCE = grades[0].ClassEnrollment__c;
		ID classOfGradeFromAssessment = grades[0].Assessment__c;
        
        System.debug('classOfGradeFromCE: ' + classOfGradeFromCE);
        System.debug('classOfGradeFromAssessment: ' + classOfGradeFromAssessment);
        
        List<Grade__c> gs = [SELECT ID FROM Grade__c WHERE ClassEnrollment__r.Class__c =: classOfGradeFromCE];
        System.debug('gs: ' + gs);
        
        if (gs.size() > 0) {
            System.debug('There already exists a grade.');
        } else {
            System.debug('All good in the hood.');
        }
    }
}
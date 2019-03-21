public class ClassEnrollmentGrades {
    // static method passing a list of Class Enrollments 
    public static void setExistingAssesmentGradesToDefault(list<ClassEnrollment__c> classEnrollments){
       // Go through list of CE, store classes for givcen CE 
        List<Id> classForCE = new List<Id>(); 
        for(ClassEnrollment__c classEnrollment : classEnrollments){
            classForCE.add(classEnrollment.Class__c); 
        }
       // Go throught new set of classes pull existing Assesments 
        List<Grade__c> grdToInsert = new List<Grade__c>(); 
        for(Assessment__c existingAssessments : [SELECT Id, Class__c
                                                 FROM Assessment__c 
                                                 WHERE Class__c in : classForCE]){
            for(classEnrollment__c classEnrollment : classEnrollments){
                if(classEnrollment.Class__c == existingAssessments.Class__c){
                    Grade__c grd = new Grade__c(); 
                    grd.Assessment__c = existingAssessments.Id;
                    grd.ClassEnrollment__c = classEnrollment.Id;
                    grdToInsert.add(grd);     
                } 
                  
            }    
        }
        insert grdToInsert; 
            
        
    }
    
    
    public static void setStudentGrades(list<Assessment__c> listAssessments){
        // Go through the Assessments class 
        // Store the class id for each assessment in a list 
        list<id> assessClass = new list<id>();
        for(Assessment__c listAssessment : listAssessments){
            assessClass.add(listAssessment.Class__c); 
        }
        
        // from the list of class Id's grab the class enrollments
        list<Grade__c> grdsToInsert = new list<Grade__c>(); 
       for(ClassEnrollment__c classEnrollment : [SELECT Id, Class__c 
                                                  FROM ClassEnrollment__c
                                                  WHERE Class__c in : assessClass]){
            for(Assessment__c listAssessment : listAssessments){
                if(classEnrollment.Class__c == listAssessment.Class__c){
                    //assign the new grades  
                    Grade__c g = new Grade__c(Grade__c = 0.0); 
                    g.Assessment__c = listAssessment.Id;
                    g.ClassEnrollment__c = classEnrollment.Id;
                    System.debug('Grade: ' + g.Grade__c);
                    grdsToInsert.add(g); 
                }                                           
            }                                                      
        }
        System.debug('grdsToInsert: ' + grdsToInsert);
        insert grdsToInsert;     
    } 
 }
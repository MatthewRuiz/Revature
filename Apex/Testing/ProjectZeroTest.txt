@isTest
public class ProjectZeroTest {
    @testSetup static void setup() {
        TestDataFactory.createTestAccounts(200);
    }
    
    @isTest static void testFibonacci() {
        // Single Action - Positive
        System.assertEquals(1, ProjectZero.fibonacci(1));
        System.assertEquals(1, ProjectZero.fibonacci(2));
        System.assertEquals(2, ProjectZero.fibonacci(3));
        System.assertEquals(89, ProjectZero.fibonacci(11));
        System.assertEquals(6765, ProjectZero.fibonacci(20));
        System.assertEquals(196418, ProjectZero.fibonacci(27));
        
        // Single Action - Negative
        System.assertEquals(-1, ProjectZero.fibonacci(-5));
    }
    
    @isTest static void testSortArray() {
        // Single Action - Positive
        List<Integer> unsortedArray = new List<Integer>{2,4,5,1,3,1};
            List<Integer> sortedArray = new List<Integer>{1,1,2,3,4,5};
                List<Integer> returnedArray = ProjectZero.sortArray(unsortedArray);
        
        for (Integer i = 0; i < sortedArray.size(); i++) {
            System.assertEquals(sortedArray[i], returnedArray[i]);
        }
    }
    
    @isTest static void testFactorial() {
        System.assertEquals(1, ProjectZero.factorial(0));
        System.assertEquals(1, ProjectZero.factorial(1));
        System.assertEquals(120, ProjectZero.factorial(5));
        System.assertEquals(720, ProjectZero.factorial(6));
        System.assertEquals(5040, ProjectZero.factorial(7));
    }
    
    @isTest static void testRotateArray() {
        List<Integer> unrotatedL1 = new List<Integer> {4,7,9,13,2,1};
        List<Integer> rotatedL1 = new List<Integer> {2,1,4,7,9,13};
        List<Integer> returnedRotatedL1 = ProjectZero.rotateLeft(unrotatedL1, 16);
        
        for(Integer i = 0; i < unrotatedL1.size(); i++) {
            System.assertEquals(rotatedL1[i], returnedRotatedL1[i]);
        }
    }
    
    @isTest static void testUpdateAccountSize() {
        // Test Single Action - Positive]
        List<Account> accList = new List<Account>();
        accList.add(new Account(Name='Test12345', NumberOfEmployees=1));
        accList.add(new Account(Name='Test123456', NumberOfEmployees=1001));
        accList.add(new Account(Name='Test1234567', NumberOfEmployees=11000));
		insert accList;
        
        ProjectZero.updateAccountSize();
        
        Account a1 = [SELECT Size__c FROM Account WHERE Name='Test12345' LIMIT 1];
        System.assertEquals('Small', a1.Size__c);
        Account a2 = [SELECT Size__c FROM Account WHERE Name='Test123456' LIMIT 1];
        System.assertEquals('Medium', a2.Size__c);
        Account a3 = [SELECT Size__c FROM Account WHERE Name='Test1234567' LIMIT 1];
        System.assertEquals('Large', a3.Size__c);

        
        // Test Bulk Action - Positive
        List<Account> accs = [SELECT NumberOfEmployees, Size__c FROM Account WHERE Name LIKE 'Test%'];
        for(Account a : accs) {
            if (a.NumberOfEmployees < 1000) {
                System.assertEquals('Small', a.Size__c);
            } else if(a.NumberOfEmployees > 1000 && a.NumberOfEmployees < 10000){
                System.assertEquals('Medium', a.Size__c);
            } else {
                System.assertEquals('Large', a.Size__c);
            }
        }
    }    
    
    
    @isTest static void updateCALeads() {
        List<Lead> leads = new List<Lead>();
        leads.add(new Lead(LastName='Test1234', State='CA', Company='123'));
        leads.add(new Lead(LastName='Test12345', State='CA', Company='123'));
        leads.add(new Lead(LastName='Test123456', State='CA', Company='123'));
        insert leads;
        
        ProjectZero.updateCALeads();
        
        List<Lead> ls = [SELECT Status, Description FROM Lead];
        for(Lead l : ls) {
            System.assertEquals('Closed - Not Converted', l.Status);
            System.assertEquals('We are no longer doing business in California.', l.Description);
        }
    }

}
@isTest
public class ProjectZeroTest {
    @isTest static void testFibonacci() {
        // Test Single Action - Positive
        System.assertEquals(1, P0.fibonacci(1));
        System.assertEquals(1, P0.fibonacci(2));
        System.assertEquals(2, P0.fibonacci(3));
        System.assertEquals(89, P0.fibonacci(11));
        System.assertEquals(6765, P0.fibonacci(20));
        System.assertEquals(196418, P0.fibonacci(27));
        
        // Test Single Action - Negative
        System.assertEquals(-1, P0.fibonacci(-5));
        
        // Test Bulk Action - Positive (Can't do for this method)
        // Test Bulk Action - Negative (Can't do for this method)
        // Test Restricted User - (Can't do for this method)
    }
    
    @isTest static void testSortArray() {

    }
    
    @isTest static void testBalancedBrackets() {
        // Test Single Action - Positive
        System.assertEquals(true, P0.balancedBrackets('()'));
        System.assertEquals(true, P0.balancedBrackets('({[[({()})]]})'));
        System.assertEquals(true, P0.balancedBrackets('((((([[]])))))'));
        
        // Test Single Action - Negative
        System.assertEquals(false, P0.balancedBrackets('0'));
        System.assertEquals(false, P0.balancedBrackets('(((5)))'));
        System.assertEquals(false, P0.balancedBrackets('{[[))]'));
        System.assertEquals(false, P0.balancedBrackets('()(((()))}'));
    }
    
    @isTest static void testUpdateAccountSize() {
        // Test Single Action - Positive
 		insert new Account(Name='Test12345', NumberOfEmployees=1);
        P0.updateAccountSize();
        Account a = [SELECT Id, Name, Size__c, NumberOfEmployees FROM Account WHERE Name='Test12345'];
        
        System.debug('a.NumberOfEmployees: ' + a.NumberOfEmployees);
        System.assertEquals('Small', a.Size__c);
    }
}
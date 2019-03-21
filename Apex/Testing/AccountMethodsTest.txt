@isTest
public class AccountMethodsTest {
    
    /*@testSetup static void setup() {
        List<Account> accs = new List<Account>();
        
        accs.add(new Account(Name='Test1', NumberOfEmployees=1500, NumberOfLocations__c=1));
        accs.add(new Account(Name='Test2', NumberOfEmployees=1500, NumberOfLocations__c=4));
        accs.add(new Account(Name='Test3', NumberOfEmployees=15000, NumberOfLocations__c=12));
        
        insert accs;
        //TestDataFactory.createTestAccounts(200);
    }*/
    
    @isTest(SeeAllData=true) 
    static void testUpdateAccountSizeFromNumberOfEmployees() {
        AccountMethods.updateAccountSizeFromNumberOfEmployees();
        
        List<Account> accList = [SELECT Size__c, NumberOfEmployees FROM Account];
        System.debug('accList: ' + accList);
        
        for(Account a : accList) {
            if(a.NumberOfEmployees > 0 && a.NumberOfEmployees < 1000){
                System.assertEquals('Small', a.Size__c);
            } else if(a.NumberOfEmployees > 1000 && a.NumberOfEmployees < 10000){
                System.assertEquals('Medium', a.Size__c);
            } else {
                System.assertEquals('Large', a.Size__c);
            }
        }
    }
    
    @isTest static void testUpdateAccountSizeFromNumberOfLocations() {
        AccountMethods.updateAccountSizeFromNumberOfLocations();
        
        List<Account> accList = [SELECT Size__c, NumberOfLocations__c FROM Account];
        System.debug('accList: ' + accList);
        
        for(Account a : accList) {
            if(a.NumberOfLocations__c > 0 && a.NumberOfLocations__c <= 3){
                System.assertEquals('Small', a.Size__c);
            } else if(a.NumberOfLocations__c > 3 && a.NumberOfLocations__c <= 6){
                System.assertEquals('Medium', a.Size__c);
            } else {
                System.assertEquals('Large', a.Size__c);
            }
        }
    }
}
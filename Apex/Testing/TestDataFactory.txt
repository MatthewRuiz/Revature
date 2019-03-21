@isTest
public class TestDataFactory {
    public static void createTestAccounts(Integer numAccts) {
        List<Account> accts = new List<Account>();
        
        for(Integer i = 0; i < numAccts; i++) {
            Account a = new Account(Name='TestAccount' + i, NumberOfEmployees=(Integer)(Math.random()*15*900), NumberOfLocations__c=(Integer)(Math.random()*10));
            accts.add(a);
        }
        insert accts;
    }
}
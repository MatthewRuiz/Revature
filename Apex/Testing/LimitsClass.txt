@isTest(SeeAllData=true)
public class LimitClass {
    @isTest static void methodOne() {
        List<Account> accList = new List<Account>();
        for(Integer i = 0; i < 5; i++) {
            Account a = new Account(Name='Test' + i);
            accList.add(a);
        }
        insert accList;
        
        System.debug('Number of DML statements in methodOne: ' + Limits.getDmlStatements());
        System.debug('Number of DML statements allowed: ' + Limits.getLimitDmlStatements());
        
        System.debug('Amount of heap size used in methodOne: ' + Limits.getHeapSize());
        System.debug('Total amount of heap allowed: ' + Limits.getLimitHeapSize());
    }
    
    @isTest static void methodTwo() {
        
        for(Integer i = 0; i < 5; i++) {
            Account a = new Account(Name='Test' + i);
            insert a;
        }
        
        System.debug('Number of DML statements in methodOne: ' + Limits.getDmlStatements());
        System.debug('Number of DML statements allowed: ' + Limits.getLimitDmlStatements());
        
        System.debug('Amount of heap size used in methodOne: ' + Limits.getHeapSize());
        System.debug('Total amount of heap allowed: ' + Limits.getLimitHeapSize());
    }
}
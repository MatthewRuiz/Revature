public class AccountMethods {
    public static void updateAccountSizeFromNumberOfEmployees() {
        List<Account> accs = [SELECT NumberOfEmployees FROM Account];
        
        for(Account a : accs) {
            if(a.NumberOfEmployees > 0 && a.NumberOfEmployees < 1000){
                a.Size__c = 'small';
            } else if(a.NumberOfEmployees > 1000 && a.NumberOfEmployees < 10000){
                a.Size__c = 'medium';
            } else {
                a.Size__c = 'large';
            }
        }
        update accs;
    }
    
    public static void updateAccountSizeFromNumberOfLocations() {
        List<Account> accs = [SELECT NumberOfLocations__c FROM Account];
        
        for(Account a : accs) {
            if(a.NumberOfLocations__c > 0 && a.NumberOfLocations__c <= 3){
                a.Size__c = 'Small';
            } else if(a.NumberOfLocations__c > 3 && a.NumberOfLocations__c <= 6){
                a.Size__c = 'Medium';
            } else {
                a.Size__c = 'Large';
            }
        }
        update accs;
    }
}
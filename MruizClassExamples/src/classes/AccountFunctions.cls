public class AccountFunctions {
    public static List<Account> getAccountsWithIDAndName() {
        System.debug('Hello Moto');
        return [SELECT Id, Name FROM Account];
    }
}
public class DMLExamples {
    // Tis method inserts three account records and updates an existing
    // account record.
    public static void insertAndUpdateExample() {
        
        List<Account> accountsToInsert = new List<Account>();
        
        // Create three account sObjects and add to list
        // We DO NOT want to perform DML on individual sObjects/records
        // so we add to a List.
        for (Integer i = 0; i < 3; i++) {
            Account a = new Account(Name='Wal-Mart' + i,
                                    BillingCity='San Francisco');
            accountsToInsert.add(a);
        }
        
        Account accountToUpdate;
        try {
            insert accountsToInsert;

            // Update account Wal-Mart2
            accountToUpdate = [SELECT BillingCity
                               FROM Account
                               WHERE Name='Wal-Mart2'
                               LIMIT 1];
            
            System.debug('Wal-Mart2: ' + accountToUpdate);
            
            // Update the billing city
            accountToUpdate.BillingCity = 'New York';
            
            update accountToUpdate;
        } catch(DMLException e) {
            System.debug('An unexpected error has occurred: ' + e.getMessage());
        }
        System.debug('Wal-Mart2: ' + accountToUpdate);
    }
    
    /*
     * You can insert records related to existing records if a relationship has already been defined
     * between the two objects. A record is associated with a related record through a foreign kry ID.
     * 
     * This example adds a Contact to an Account (the related record) by setting the AccountId field
     * on the contact.
     * 
     * */
    public static void insertingRelatedRecords() {
        try {
            Account a = new Account(Name='SFDC Account');
            insert a;
            
            // Once the account is inserted, the sObject will be populated with an ID.
            // Get this ID.
            Id aId = a.Id;
            
            // Add a contact to this Account
            Contact c = new Contact(
                FirstName='Matt',
                LastName='Ruiz',
                Phone='0000000000',
                AccountId=aId);
            
            insert c;
        } catch(DMLException e) {
            System.debug('An unexpected error has occurred: ' + e.getMessage());
        }
    }
    
    public static void classExample() {
        try {
            Class__c c = new Class__c(Name='PHY200');
            insert c;
            
            Student__c s = new Student__c(Name='Peter');
            insert s;
            
            ClassEnrollment__c ce = new ClassEnrollment__c(Class__c = c.Id, Student__c = s.Id);
            insert ce;
            
            Asessment__c assess = new Asessment__c(Name='Quiz 2', Class__c = c.Id);
            insert assess;
            
            Grade__c g = new Grade__c(Grade__c=80, Asessment__c = assess.Id);
            insert g;
        }  catch(DMLException e) {
            System.debug('An unexpected error has occurred: ' + e.getMessage());
        }
    }
    
    
    /*
     * Fields on related records can't be updated with the same call
     * to the DML operation and require a seperate DML call.
     * For example, if inserting a new contact, you can specify the contact's
     * related account record by setting the value of the AccountId field.
     * However, you can't change the account's name without updaing the 
     * account itself with a seperate DML call.
     * Similary, when updating an a contact, if you also want to update
     * the contact's related account, you must make two DML calls.
     * 
     * */
    public static void updatingRelatedRecords() {
        try {
            // QUery for the contact, which has been associated with an account.
            Contact queriedContact = [SELECT Phone, Account.Industry
                                      FROM Contact
                                      WHERE FirstName='Matt'
                                      AND LastName='Ruiz'
                                      LIMIT 1];
            
            // Update the contact's phone number
            queriedContact.Phone = '1111111111';
            
            // Update the related account inductry.
            queriedContact.Account.Industry = 'Technology';
            
            // Make two seperate calls
            // 1. This call is to update the contact's phone.
            update queriedContact;
            // 2. This call is to update the related account's industry field.
            update queriedContact.Account;
        }  catch(DMLException e) {
            System.debug('An unexpected error has occurred: ' + e.getMessage());
        }
    }
    
    /*
     * Using the upsert operation, you can either insert or update an existing record in
     * one call. To determine whether a record already exists, the upsert statement or
     * Database method uses the record's ID as the key to match records, a custom external ID,
     * or a standard field with the idLookup attribute set to true. 
     * 	
     * - If the key is not matched, then a new record is created.
     * - If the key is matched once, then the existing record is updated.
     * - If the key is matched multuiple times, then an error is generated and the object
     * 		is neither inserted or updated.
     * 
     * */
    public static void upsertExample() {
        List<Account> accountList = [SELECT BillingCity
                                     FROM Account
                                     WHERE BillingCity='San Francisco'];
        
        //for (INteger i = 0; i < accountList.size(); i++) {
        //    accountList[i].BillingCity = '';
        //}
        
        for (Account a : accountList) {
            a.BillingCity = 'Mumbai';
        }
        
        Account a = new Account(Name='Acme', BillingCity='San Francisco');
        accountList.add(a);
        
        try {
            upsert accountList;
        } catch(DMLException e) {
            System.debug('An unexpected error has occurred: ' + e.getMessage());
        }
    }
    
    /*
     * Only available for lead, contact, or account records.
     * You cna merge up to three records of the same sObject type. 
     * The merge operation merges up to three records into one of the records,
     * deletes the others, and reparetns any related records. 
     * 
     * */
    public static void mergeExample() {
        // Insert new accounts
        List<Account> ls = new List<Account> { new Account(Name='Mcdonalds Inc.', BillingCity='San Fran'),
            								   new Account(Name='Mcdonalds', BillingCity='New York')};
        insert ls;
        
        // Queries to get the inserted accounts
        Account masterAccount = [SELECT Id, Name FROM Account WHERE Name='Mcdonalds Inc.' LIMIT 1];
        Account mergeAccount = [SELECT Id, Name FROM Account WHERE Name='Mcdonalds' LIMIT 1];
        
        // Add a contact to the account to be merged
        Contact c = new Contact(FirstName='Mcdonalds', LastName='Merged');
        c.AccountId = mergeAccount.Id;
        insert c;
        
        Account[] result = [SELECT Id, Name FROM Account WHERE Name LIKE '%Mcdonalds%'];
        System.debug('Before merge: ' + result);
        
        try {
            merge masterAccount mergeAccount;
        } catch(DMLException e) {
            System.debug('An unexpected error has occurred: ' + e.getMessage());
        }
        
        Account[] res = [SELECT Id, Name FROM Account WHERE Name LIKE '%Mcdonalds%'];
        System.debug('After merge: ' + res);
    }
    
    /*
     * You can delete records using the delete operation.
     * Deleted records aren't deleted permanently from Salesforce, but they are
     * placed in the Recycle Bin for 15 days from where they can be restored.
     * 
     * */
    public static void deleteExample() {
        insert new Account(Name='DotCom');
        Account[] doomedAccounts = [SELECT Name FROM Account WHERE Name='DotCom'];
        System.debug('Doomed Accounts: ' + doomedAccounts);
        
        try {
            delete doomedAccounts;
        } catch(DMLException e) {
            System.debug('An unexpected error has occurred: ' + e.getMessage());
        }
        System.debug('Doomed Accounts: ' + [SELECT Name FROM Account WHERE Name='DotCom']);
    }
    
    public static void undeleteExample() {
        // SOQL statements can use the ALL ROWS keywords to query all records in an organization,
        // including deleted records and archived activities.
        // You can use ALL ROWS to query records in your org's REcycle Bin.
        // You CANNOT use the ALL ROWS keywords with the FOR UPDATE keywords.
        Account[] savedAccounts = [SELECT Name FROM Account WHERE Name='DotCom' ALL ROWS];
        System.debug('Saved Accounts before undelete: ' + savedAccounts);
        
        try {
            undelete savedAccounts;
        }  catch(DMLException e) {
            System.debug('An unexpected error has occurred: ' + e.getMessage());
        }
        
        System.debug('Saved Accounts after undelete: ' + [SELECT Name FROM Account WHERE Name='DotCom']);
    }
    
    public static void queryForLoop() {
        List<Account> accountList = [SELECT Id, Name, BillingState FROM Account LIMIT 5];
        
        for (Account a : accountList) {
            a.BillingState = 'CA';
        }
        
        // Use SOQL queries inside of a for loop signature if you don't plan to use the 
        // list of sObjects outside of the for loop.
        for (Account a : [SELECT Id, Name FROM Account LIMIT 5]) {
            System.debug('a: ' + a);
        }
        
    }
    
    public static void badPractices() {
        // This counts at 100 DML statements. You're allowed 150 in one transaction. 
        for (INteger i = 0; i < 100; i++) {
            Account a = new Account(Name='Account' + i);
            insert a;
        }
        
        // INstead you should do
        Account[] accList = new List<Account>();
        for (INteger i = 0; i < 100; i++) {
            Account a = new Account(Name='Account' + i);
            accList.add(a);
        }
        insert accList;
        
        // This will query 100 times
        for (Integer i = 0; i < 100; i++) {
            Account[] ls = [SELECT Id, Name FROM Account];
        }
        
        // This will query 1 time
        for (Account a : [SELECT Id, Name FROM Account]) {
            // do some stuff
        }
        
        Account[] aList = [SELECT Id, Name FROM Account];
        for(Account a : aList){
            // do some stuff
        }
        
    }
    
    public static void dataBaseClass() {
        List<Account> accList = new List<Account>();
        accList.add(new Account(Name='Acme1'));
        accList.add(new Account(Name='Acme2'));
        accList.add(new Account());
        
        /*try {
            insert accList;
        } catch(DMLException e) {
            System.debug('An unexpected error has occurred: ' + e.getMessage());
        }*/
        
        // DML Statement using Database Class
        Database.SaveResult[] srList = Database.insert(accList, false);
        
        // Iterate through each returned result
        for (Database.SaveResult sr : srList) {
            if (sr.isSuccess()) {
                System.debug('Successfully inserted account. Account ID: ' + sr.getId());
            } else {
                // Operation failed, so get all errors
                for (Database.Error err : sr.getErrors()) {
                    System.debug('The following error has occurred.');
                    System.debug(err.getStatusCode() + ': ' + err.getMessage());
                    System.debug('Accounts fields that affected this error: ' + err.getFields());
                }
            }
        }
        
    }
}
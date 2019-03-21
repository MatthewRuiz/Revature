public class DMLExamples {
    /*
* This method inserts three account records and updates an existing account record. 
* */
    public static void insertAndUpdateExample() {
        List<Account> accounts = new List<Account>();
        // Create three account sObjects and add to list
        // We DONT want to perform DML on individual sObjects/records so we add to a List
        for(Integer i = 0; i < 3; i++) {
            Account a = new Account(Name='Wal-Mart' + i, BillingCity='San Francisco');
            accounts.add(a);
        }
        
        Account accountToUpdate;
        try {
            insert accounts;
            
            // Update account Wal-Mart2
            accountToUpdate = [SELECT BillingCity FROM Account
                               WHERE Name='Wal-Mart2' AND BillingCity='San Francisco'
                               LIMIT 1];
            // Update the billing city
            accountToUpdate.BillingCity = 'New York';
            
            update accountToUpdate;
        } catch(DMLException e) {
            System.debug('An unexpected error had occurred: ' + e.getMessage());
        }  
    }
    
    /*
* You can insert records related to existing records if a relationship has already been defined between the two objects, such as a lookup
* or master-detail relationship. A record is associated with a related record through a foreign key ID.
* 
* This example adds a contact to an account (the related record) by setting the AccountId firld on the contact.
* 
* */
    public static void insertingRelatedRecords() {
        try {
            Account acct = new Account(Name='SFDC Account');
            insert acct;
            
            // Once the account is inserted, the sObject will
            // be populated with an ID.
            // Get this ID.
            Id acctID = acct.Id;
            
            // Add a contact to this account.
            Contact con = new Contact(
                FirstName='Matt',
                LastName='Ruiz',
                Phone='2154851320',
                AccountId=acctId);
            insert con;
        } catch(DMLException e) {
            System.debug('An unexpected error had occurred: ' + e.getMessage());
        }
    }
    
    /*
* Fields on related records can't be updated with the same call to the DML operation and require a seperate DML call.
* For example, if inserting a new contact, you can specify the contact's related account record by setting the value of the AccountId field.
* However, you can't change the account's name without updateing the account itself with a seperate DML call.
* Similarly, when updating a contact, if you also want to update the contact's related account, you must make two DML calls.
* 
* The following example updates a contact and its related account using two update statements.
* */
    public static void updatingRelatedRecords() {
        try {
            // QUery for the contact, which has been associated with an account.
            Contact queriedContact = [SELECT Account.Name
                                      FROM Contact
                                      WHERE FirstName = 'Matt' AND LastName = 'Ruiz'
                                      LIMIT 1];
            
            // Update the contact's phone number
            queriedContact.Phone = '2150000000';
            
            // Update the related account industry.
            queriedContact.Account.Industry = 'Technology';
            
            // Make two seperate calls
            // 1. This call is to update the contact's phone.
            update queriedContact;
            // 2. This call is to update the related account's Industry field.
            update queriedContact.Account;
        } catch(DMLException e) {
            System.debug('An unexpected error had occurred: ' + e.getMessage());
        }
    }
    
    /*
* Using the upsert operation, you can either insert or update an existing record in one call.
* To determine whether a record already exists, the upsert statement or Database method uses the record's ID as the key 
* to match records, a custom external ID field, or a standard field witht he idLookup attribute set to true.
* 
* 	- If the key is not matched, then a new record is created.
* 	- If the key is matched once, then the existing record is updated.
* 	- If the key is matched multiple times, then an error is generated and the object record is neither inserted or updated.
* */
    public static void upsertExample() {
        List<Account> accountList = [SELECT Id, Name, BillingCity FROM Account WHERE BillingCity='Bombay'];
        
        for (Account a : accountList) {
            a.BillingCity = 'Mumbai';
        }
        
        Account newAccount = new Account(Name='Acme', BillingCity='San Francisco');
        accountList.add(newAccount);
        
        try {
            upsert accountList;
        } catch(DMLException e) {
            System.debug('An unexpected error had occurred: ' + e.getMessage());
        } 
    }    
    
    
    /*
* Merging Records
* 
* When you have duplicate loead, contact, or account records in the database, cleaning up your data and consolidating the records might be a good idea.
* You can merge up to three records of the same sObject type. The merge operation merges up to three records into one of the records,
* deletes the others, and reparents any related records.
* */
    public static void mergeExample() {
        // Insert new accounts
        List<Account> ls = new List<Account> { new Account(Name='Dunkin Inc.'), new Account(Name='Dunkin')};
            insert ls;
        
        // Queries to get the inserted accounts 
        Account masterAcct = [SELECT Id, Name FROM Account WHERE Name = 'Dunkin Inc.' LIMIT 1];
        Account mergeAcct = [SELECT Id, Name FROM Account WHERE Name = 'Dunkin' LIMIT 1];
        
        // Add a contact to the account to be merged
        Contact c = new Contact(FirstName='Matt',LastName='Merged');
        c.AccountId = mergeAcct.Id;
        insert c;
        
        Account[] result = [SELECT Id, Name FROM Account WHERE Name LIKE '%Dunkin%'];
        System.debug('Before merge: ' + result);
        
        try {
            merge masterAcct mergeAcct;
        } catch (DmlException e) {
            // Process exception
            System.debug('An unexpected error has occurred: ' + e.getMessage()); 
        }
        
        Account[] res = [SELECT Id, Name FROM Account WHERE Name LIKE '%Dunkin%'];
        System.debug('After merge: ' + res);
        
    }
    
    
    /*
* After you persist records in the database, you can delete those records using the delete operation. 
* Deleted records aren’t deleted permanently from Salesforce, but they are placed in the Recycle Bin
* for 15 days from where they can be restored. 
* 
* */
    public static void deleteExample() {
        insert new Account(Name='DotCom');
        System.debug('Doomed Account: ' + [SELECT Id, Name FROM Account WHERE Name='DotCom']);
        Account[] doomedAccts = [SELECT Id, Name FROM Account 
                                 WHERE Name = 'DotCom']; 
        try {
            delete doomedAccts;
        } catch (DmlException e) {
            // Process exception here
        }
        System.debug('Doomed Account: ' + [SELECT Id, Name FROM Account WHERE Name='DotCom']);
    }
    /*
* After you have deleted records, the records are placed in the Recycle Bin for 15 days, after which they are permanently deleted.
* While the records are still in the Recycle Bin, you can restore them using the undelete operation.
* If you accidentally deleted some records that you want to keep, restore them from the Recycle Bin.
* 
* */
    public static void undeleteExample() {
        Account a = new Account(Name='Universal Containers');
        insert(a);
        insert(new Contact(LastName='Carter',AccountId=a.Id));
        delete a;
        
        
        Account[] savedAccts = [SELECT Id, Name FROM Account WHERE Name = 'Universal Containers' ALL ROWS]; 
        System.debug('savedAccounts: ' + savedAccts);
        try {
            undelete savedAccts;
        } catch (DmlException e) {
            // Process exception here
        }
    }
    
    public static void forExample() {
        
    }
}
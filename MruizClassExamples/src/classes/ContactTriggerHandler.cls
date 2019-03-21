/*
 * 
 * 
 * 
 */

public class ContactTriggerHandler {
    /*
     * 
     */
    public Static List<Contact> checkForDuplicates(List<Contact> newContacts){

        //Step1: Extract email from new contacts
        Set<String> newEmailSet = new Set<String>();
        for(Contact newContact: newContacts){
            if(newContact.email != null){
                newEmailSet.add(newContact.email);
            }
        }
        
        //Step2: Find duplicate conatcts from database
        Map<String, Contact> existingContactMap = new Map<String, Contact>();
        for(Contact existingContact:  [select id, name, email from contact where email in :newEmailSet]){
            existingContactMap.put(existingContact.email, existingContact);
        }
        
        //Step3: Compare and throw error
        for(Contact newContact: newContacts){
            Contact duplicateContact = existingContactMap.get(newContact.email);
            if(duplicateContact != null){
                newContact.addError('ERROR: There is already an Identical Record: <a href=\'/'+duplicateContact.id+'\'>'+ duplicateContact.Name+'</a>', false);
            }
        }
        
        return newContacts;
    }
    
    /*
     * 
     * 
     */
    public Static list<Contact> linkAccounts(List<Contact> newContacts){
        //Step1 : Get Last names from new contacts being created
        Set<String> lastNameSet = new Set<String>();
        for(Contact thisContact: newContacts){
            lastNameSet.add(thisContact.LastName);
        }
                
        //Step2 : Find accounts with name as last name identified in step 1
        Map<String, ID> accountNameToIDMap = new Map<String, ID>();
        for(Account thisAccount: [select id, name from Account where name in :lastNameSet]){
            accountNameToIDMap.put(thisAccount.name, thisAccount.id);
        }
        
        //Step3 : Populate accountID based on accounts identified in step 2, 
        //by matching account.name = contact.lastname
        for(Contact thisContact: newContacts){
            thisContact.AccountId = accountNameToIDMap.get(thisContact.LastName);
        }  
		
        
        /* anothing wy to combile step 2 and 3
        List<Account> accounts = [select id, name from Account where name in :lastNameSet];
        for(Contact thisContact: newContacts){
            for(Account thisAccount: accounts){
                if(thisAccount.name == thisContact.LastName){
                    thisContact.AccountId = thisAccount.id;
                }
            }
        }  
		*/
		        
        return newContacts;
    }
    
}
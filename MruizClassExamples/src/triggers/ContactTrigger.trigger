trigger ContactTrigger on Contact (before insert, after insert) {
    if (Trigger.isInsert && Trigger.isAfter) {
        ContactEmailHandler.emailContactsWithEmailSpecified(Trigger.new);
    } else if(Trigger.isBefore && Trigger.isInsert){
        ContactTriggerHandler.checkForDuplicates(Trigger.new);
    }
}
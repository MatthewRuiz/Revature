trigger ContactTrigger on Contact (before insert, after insert, before update) {
    // Use Trigger context variables to pinpoint trigger type.
    if (Trigger.isAfter && Trigger.isInsert) {
        PostToChatterContact.postChatterContact(Trigger.new);
    } else if (Trigger.isBefore && Trigger.isInsert) {
        DuplicateChecker.checkForContactDuplicates(Trigger.new);
    }
   
}
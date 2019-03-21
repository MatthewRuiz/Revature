public class ContactEmailHandler {
    public static void emailContactsWithEmailSpecified(List<Contact> contactList) {
        for(Contact c : contactList) {
            if (c.email == null) {
                System.debug('Contact with Last Name: ' + c.LastName + ' did not have an email specified');
                continue;
            }
            
            
            ConnectApi.FeedElement feedElement = ConnectApi.ChatterFeeds.postFeedElement(Network.getNetworkId(), c.Id, ConnectApi.FeedElementType.FeedItem, 'Somebody email this person!');
            /*if (c.email != null) {
                System.debug(c.LastName + '\'s email is: ' + c.email);
            } else {
                System.debug(c.LastName + '\'s email is: ' + c.email + ' is null.' );
            }*/
        }
        

    }
}
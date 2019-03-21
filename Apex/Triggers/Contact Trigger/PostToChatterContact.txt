public class PostToChatterContact {
    public static void postChatterContact(List<Contact> newContacts) {
        System.debug('postChatterContact is starting');
        
        for (Contact c : newContacts) {
            if (c.email == null) {
                System.debug('Contact with Last Name: ' + c.LastName + ' did not have an email specified');	
            } else {
                // Create a post on the chatter feed for the specified record.
                // See - https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/connectAPI_overview.htm
                ConnectApi.FeedElement feedElement = ConnectApi.ChatterFeeds.postFeedElement(Network.getNetworkId(),
                                                                                             c.Id,
                                                                                             ConnectApi.FeedElementType.FeedItem,
                                                                                             'Email this person!');
            }
        }
        
        System.debug('postChatterContact is ending');
    }
}
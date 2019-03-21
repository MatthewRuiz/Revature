/* 
 * 	@author Matthew Ruiz
 * 	@date 02/22/19
 *  @description The Automobile class will introduce us to the Apex Programming Language.
 * 
 * */

// 'public' is the access modifier, indicating that this class can be used by any Apex in this application or namespace.
// 'class' is required for class declaration
// 'Automobile' is our class name
public class Automobile {
    
    // ------------------------------------ DATA TYPES ---------------------------------------------
    //	- All Apex variables are initialized to null. 	
	
    
    // ------- START PRIMITIVE DATA TYPES ----------
    
    // 'private' is another access modifier. This is the default,
    //  and means that the variable is accessible only within the Apex class in which it is defined.
    //  
    // 'String' is our data type. Since Apex is Strongly typed, we must state the data type when we declare variables.
    // 
    // 'make' is the name of our variable. It is how we know which values we're talking about in different situations.
    // 
    // We are assigning this variable the value of 'Ford'. We use single quotes ('') to indicate that the containing information is a String.
    // 
    // Lastly, we MUST include a semi-colon (;) at the end of each statement. 
	private String make = 'Ford';
    
    // A String is any set of characters within single quotes. It does not have any limit for the number of characters.
    private String model = 'Focus';
    
    // An Integer is a 32-bit number that does not include any decimal point.
    // The value range for this starts from -2,147,483,648 and the maximum is up to 2,147,483,647.
    private Integer year = 2019;
    
    // A Long is a 64-bit number without a decimal point. This is used when we need a range of values wider than those provided by Integer.
    private Long totalFeetDrivenByFordFocus = 21474838973344648L;
    
    // A Boolean can be either true, false or null. Many times, this type of variable can be used as a flag in programming to
    // identify if the particular condition is set or not.
    private Boolean pastInspection = false;
    
    // A Date is a value that indicates a particular day. Date variables contain no information about time.
    Date purchaseDate = Date.newInstance(2019, 2, 25);
    
    // A Datetime is a value that indicates a particular dat and time, such as a timestamp.
    DateTime inspectionAppointment = DateTime.newInstance(2019, 2, 25, 3, 27, 12);
    
    // A Decimal is a numer that includes a decimal point. Currency fields are automatically assigned the type Decimal.
    Decimal inspectionCost = 62.45;
    
    // A Double is a 64-bit number that invludes a decimal point. Doubles have a minimum valyue of -2^63 and a maximum of (2^63)-1.
    Double tax = 2.68535;
    
    // An ID is any value 18-character Lightning Platform record identifier.
    // If you set ID to a 15-charter vavlue, Apex converts the value to its 18-character representation.
    // All invalid ID values are rejected with a runtime exception.
    // You should not explicitly create your own IDs. But, you can hardcode an ID if it is valid.
    ID automobileID = '123456789T2APGA';
    
    // An Object is any data type that is supported in Apex. All Apex data types inherit from Object.
    // You can cast an object that represents a more specific data type to its underlying data type.
    Object obj = 4;
    // Case the oject to an iteger.
    Integer numberOfTires = (Integer)obj;
    
    // ------- END PRIMITIVE DATA TYPES ---------- 
    
    // ------- START COLLECTIONS ----------
    
    // A List is an ordered collection of elements that are distinguished by their indices. 
    // List elements can be of any data type - primitive types, collections, sObects, user-defined types and
    // built-in Apex types.
    // The index position of the first element in a list ia always 0.
    
    List<String> previousOwners = new List<String>{'Mike', 'Suzie', 'Pete'}; 
    // List Example
    /*
	List<String> previousOwners = new List<String>(); 
    System.debug('previousOwners: ' + previousOwners);
    previousOwners.add('Jeff Gordon');
    previousOwners.add('Elon Musk');
    System.debug('previousOwners: ' + previousOwners);
    System.debug('firstOwner: ' + previousOwners[0]);
    System.debug('firstOwner: ' + previousOwners.get(0));
    previousOwners.clear();
    System.debug('previousOwners: ' + previousOwners);
    */
    
        
    // A set is an unordered collection of elements that do not contain any duplicates.
    // Set elements can be of any data type - primitive types, collections, sObjects, user-defined types,
    // and built-in Apex types.
    
    
    
}
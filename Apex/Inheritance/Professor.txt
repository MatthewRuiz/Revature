public class Professor extends Person {

    // Properties
    // MUST be public
    public Decimal salary {
        get {
            if (salary == null) {
                salary = 0.0; 
            }
            // If you specify an implementation for get,
            // you MUST provide a return statement.
            return salary;
        }
        set {
            // value is a keyword which represent the value a property
            // is being set to.
            if (value < 0.0) {
                System.debug('You cannot have a negative salary. That\'s called debt.');
            } else {
                salary = value;
            }
        }
    }
    
    // Constructors
    /*
     * 	This default constructor will automatically call the Person
     * 	default constructor, setting name and email to 
     * 	empty strings.
     * 	Likewise, it will set the salary field to 0.0
     * */
    public Professor() {
        salary = 0.0;
    }
    
    /*
     * 	This constructor will call the Person constructor, setting name 
     * 	to the specified parameter (name).
     * 	Likewise, it willl call the setEmail method from the 'parent' class,
     *  setting the email fields.
     * 	Lastly, it will set salary to a default value.
     * */
    public Professor(String name, String email) {
		super(name);
        setEmail(email);
        
        this.salary = 0.0;
    }
    
    /* 
     * 	The display method calls the PErson display method to display
     * 	the name and email address.
     * 	Afterwards, the Professor's salary will be displayed.
     * */
    public override void display() {
        super.display();
        System.debug('Salary: ' + this.salary);
    }
}
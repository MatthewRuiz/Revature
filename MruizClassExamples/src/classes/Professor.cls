public class Professor extends Person {
	// Fields
	
    private Double salary;
    
    // Constructors
    
    /*
     * 		This default constructor will automatically call the Person default constructor, setting name and email to empty strings.
     * 		Likewise, it will set the salary field to 0.0
     * */
    public Professor() {
        this.salary = 0.0;
    }
    
    /*
     * 		This constructor will call the Person constructor, setting name to the specified parameter (name).
     * 		Likewise, it will call the setEmail meertyulthod from the 'parent' class, setting the email field.
     * 		Lastly, it will set salary to a default value;
     * */
    public Professor(String name, String email) {
        super(name);
        setEmail(email);
        
        this.salary = 0.0;
    }
    
    // Accessor Methods
    
    public Double getSalary() {
        return this.salary;
    }
    
    // Mutator Methods
    
    public void setSalary(Double salary) {
        this.salary = salary;
    }
    
    /*
     * 		The display method calls the Person display method to display the name and email address.
     * 		Afterwards, the Professor's salary will be displayed.
     * */
    public override void display() {
        super.display();
        System.debug('Salary: ' + this.salary);
    }
    
}
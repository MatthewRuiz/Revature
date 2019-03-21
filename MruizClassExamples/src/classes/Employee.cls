public virtual class Employee extends Person {
    // Fields
    
    private String company;
    
    // Constructors
    
    /*
	* 		This default constructor will automatically call the Person default constructor, setting name and email to empty strings.
	* 		Likewise, it will set the company field to 'unemployed'.
	* */
    public Employee() {
        this.company = 'Unemployed';
    }
    
    /*
	* 		This constructor will call the Person constructor, setting name to the specified parameter (name).
	* 		Likewise, it will call the setEmail method from the 'parent' class, setting the email field.
	* 		Lastly, it will set company field to 'unemployed'.
	* */
    public Employee(String name, String email) {
        super(name);
        setEmail(email);
        
        this.company = 'Unemployed';
    }
    
    // Accessor Methods
    
    public String getCompany() {
        return this.company;
    }
    
    // Mutator Methods
    
    public void setCompany(String company) {
        this.company = company;
    }
    
    /*
	* 		The display method calls the Person display method to display the name and email address.
	* 		Afterwards, the Employee's company will be displayed.
	* */
    public override virtual void display() {
        super.display();
        System.debug('Company: ' + this.company);
    }
}
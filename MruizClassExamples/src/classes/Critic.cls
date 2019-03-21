public class Critic extends Person {
	// Fields
	
    private Integer yearsOfExperience;
    
    // Constructors
    
    /*
     * 		This default constructor will automatically call the Person default constructor, setting name and email to empty strings.
     * 		Likewise, it will set the yearsOfExperience field to 0.
     * */
    public Critic() {
        this.yearsOfExperience = 0;
    }
    
    /*
     * 		This constructor will call the Person constructor, setting name to the specified parameter (name).
     * 		Likewise, it will call the setEmail method from the 'parent' class, setting the email field.
     * 		Lastly, it will set yearsOfExperience to a default value;
     * */
    public Critic(String name, String email) {
        super(name);
        setEmail(email);
        
        this.yearsOfExperience = 0;
    }
    
    // Accessor Methods
    
    public Double getYearsOfExperience() {
        return this.yearsOfExperience;
    }
    
    // Mutator Methods
    
    public void setYearsOfExperience(Integer yearsOfExperience) {
        this.yearsOfExperience = yearsOfExperience;
    }
    
    /*
     * 		The display method calls the Person display method to display the name and email address.
     * 		Afterwards, the Critic's yearsOfExperience will be displayed.
     * */
    public override void display() {
        System.debug('Critic Information');
        super.display();
        System.debug('Years Of Experience: ' + this.yearsOfExperience);
    }
    
}
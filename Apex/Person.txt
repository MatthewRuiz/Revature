public virtual class Person {
    // Fields
    	
	private String name;		// Person's name
    private String email;		// Person's e-mail address
    
    // Constructors
    
    /*
     *		The argumentless (default) constructor sets name and email to empty strings. 
     * */
    public Person() {
        this.name = '';
        this.email = '';
    }
    
    /*
     * 		The one argument constructor sets the name field to the specified 'parameter', and it sets
     * 		the email field to the empty string.
     * 
     * 		Parameters:
     * 			name - The name of a person.
     * */
    public Person(String name) {
        this.name = name;
    }
    
    // Access Methods - Used to access data. Inside of these methods, we would perform checks to make
    // sure the user has access to the interested information.
    
    /*
     * 		The getName method returns the name of the Person.
     * 
     * 		@return - The name of the person
     * */
    public String getName() {
        return this.name;
    }
    
    /*
     * 		The getEmail method returns the email of the Person.
     * 
     * 		@return - The email of the person
     * */
    public String getEmail() {
        return this.email;
    }
    
    // Mutator Methods - Used to mutate, or edit, data. You would perform checks to make sure that the user
    // can edit the data.
    
    /*
     * 		The setName method sets the name of the Person.
     * 
     * 		Parameters:
     * 			name - The name of the Person
     * */
    public void setName(String name) {
        this.name = name;
    }
    
    /*
     * 		The setEmail method sets the email of the Person.
     * 
     * 		Parameters:
     * 			email - The email of the Person
     * */
    public void setEmail(String email2) {
        this.email = email2;
    }   
    
    
    /*
     * 		The display method displays the name and email address of the Person.
     * */
    public virtual void display() {
        System.debug('Name: ' + this.name);
        System.debug('Email: ' + this.email);
    }
}
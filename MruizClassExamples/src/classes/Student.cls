public class Student extends Person {
	// Fields
	
    private String major;
    private Professor advisor;
    
    public Student() {
        // This default constructor should set major to empty string and advisor to an instance of Professor.
        this.major = '';
        this.advisor = new Professor();
    }
    
    public Student(String name, String email, Professor advisor) {
        super(name);
        setEmail(email);
        this.major = '';
        this.advisor = advisor;
    }
    
    // Accessor Methods
    public String getMajor() {
        return this.major;
    }
    
    public Professor getAdvisor() {
        return this.advisor;
    }
    
    // Mutator Methods
    
    public void setMajor (String major) {
        this.major = major;
    }
    
    public void setAdvisor (Professor professor) {
        this.advisor = professor;
    }
    
    // Display Method
    
    public override void display() {
        System.debug('Student Information');
        super.display();
        System.debug('Major: ' + this.major);
        System.debug('');
        System.debug('Advisor Information');
        advisor.display();
    }
}
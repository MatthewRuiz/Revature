public class P {
	public String name;			// Person's name
    public Integer age = 25;	// Person's age
    private String major;		// Person's major

	// Accessors
	
    public String getMajor() {
        return major;
    }
    
    // Mutators
    
    public void setMajor(String aMajor) {
        major = aMajor;
    }
}
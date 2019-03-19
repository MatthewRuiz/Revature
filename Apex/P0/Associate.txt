public class Associate extends Employee {
		// Fields
	
    private String trainingTrack;
    private Employee trainer;
    
    public Associate() {
        // This default constructor should set major to empty string and advisor to an instance of Professor.
        this.trainingTrack = '';
        this.trainer = new Employee();
    }
    
    public Associate(String name, String email, Employee trainer) {
        super(name, email);

        this.trainingTrack = '';
        this.trainer = trainer;
    }
    
    // Accessor Methods
    public String getTrainingTrack() {
        return this.trainingTrack;
    }
    
    public Employee getTrainer() {
        return this.trainer;
    }
    
    // Mutator Methods
    
    public void setTrainingTrack (String trainingTrack) {
        this.trainingTrack = trainingTrack;
    }
    
    public void setTrainer (Employee trainer) {
        this.trainer = trainer;
    }
    
    // Display Method
    
    public override void display() {
        System.debug('Associate Information');
        super.display();
        System.debug('Training Track: ' + this.trainingTrack);
        System.debug('');
        System.debug('Trainer Information');
        trainer.display();
    }
}
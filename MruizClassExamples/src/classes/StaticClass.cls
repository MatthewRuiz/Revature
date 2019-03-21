public class StaticClass {
    // Static method
	private static Integer numberOfObjectsCreated = 0;
    // Instance method
    private Integer secondNumber = 0;
    
    public StaticClass() {
        numberOfObjectsCreated++;
        secondNumber++;
    }
    
    public Integer getNumberOfObjectsCreated() {
        return numberOfObjectsCreated;
    }
    
    public void incrementNumberOfObjectsCreated() {
        numberOfObjectsCreated++;
    }
    
    public Integer getSecondNumber() {
        return secondNumber;
    }
    
    public void incrementSecondNumber() {
        secondNumber++;
    }
    
    /*
     * 
     StaticClass s1 = new StaticClass();
StaticClass s2 = new StaticClass();
StaticClass s3 = new StaticClass();
StaticClass s4 = new StaticClass();
StaticClass s5 = new StaticClass();

System.debug('s1 numberOfObjectsCreated: ' + s1.getNumberOfObjectsCreated());
System.debug('s2 numberOfObjectsCreated: ' + s2.getNumberOfObjectsCreated());
System.debug('s3 numberOfObjectsCreated: ' + s3.getNumberOfObjectsCreated());
System.debug('s4 numberOfObjectsCreated: ' + s4.getNumberOfObjectsCreated());
System.debug('s5 numberOfObjectsCreated: ' + s5.getNumberOfObjectsCreated());
System.debug('');
s2.incrementNumberOfObjectsCreated();
System.debug('s1 numberOfObjectsCreated: ' + s1.getNumberOfObjectsCreated());
System.debug('s2 numberOfObjectsCreated: ' + s2.getNumberOfObjectsCreated());
System.debug('s3 numberOfObjectsCreated: ' + s3.getNumberOfObjectsCreated());
System.debug('s4 numberOfObjectsCreated: ' + s4.getNumberOfObjectsCreated());
System.debug('s5 numberOfObjectsCreated: ' + s5.getNumberOfObjectsCreated());
System.debug('');
System.debug('s1 secondNumber: ' + s1.getSecondNumber());
System.debug('s2 secondNumber: ' + s2.getSecondNumber());
System.debug('s3 secondNumber: ' + s3.getSecondNumber());
System.debug('s4 secondNumber: ' + s4.getSecondNumber());
System.debug('s5 secondNumber: ' + s5.getSecondNumber());
System.debug('');
s2.incrementSecondNumber();
System.debug('s1 secondNumber: ' + s1.getSecondNumber());
System.debug('s2 secondNumber: ' + s2.getSecondNumber());
System.debug('s3 secondNumber: ' + s3.getSecondNumber());
System.debug('s4 secondNumber: ' + s4.getSecondNumber());
System.debug('s5 secondNumber: ' + s5.getSecondNumber());
     * */
     
}
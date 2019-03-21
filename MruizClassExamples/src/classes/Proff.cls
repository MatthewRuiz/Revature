public class Proff extends Person {
	// Properties
    public Double salary {
        get { 
            if (salary == null) {
                salary = 0.0;
            }
            // If you specify an implementation for get, you MUST provide a return statement.
            return salary;
        }
        set {
            // Value is a keyword which represents the value a property is being set to.
            if (value < 0.0) {
                System.debug('You cannot have a negative salary.');
            } else {
                salary = value;
            }
        }
    }
   
}
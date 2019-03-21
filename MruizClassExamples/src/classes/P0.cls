public class P0 {
    /*
     * This method returns the nth number in the fibonacci sequence.
     * 
     * Parameters:
     * 	- n : The nth digit in the fibonacci sequence.
     * 
     * Return: The fibonacci number at the nth position.
     * 
     * */
    public static Integer fibonacci(Integer n) {
        if (n < 0) {
            return -1;
        }
        
        // Hold the fibonacci sequence
        List<Integer> fibNumbers = new List<Integer> {0,1};
        if (n == 0 || n == 1) {
            return fibNumbers[n];
        }
        
        // Set to 1 since our last element is 1.
        Integer numberWanted = 1;
        for(Integer i = 2; i <= n; i++) {
            numberWanted = fibNumbers[i-2] + fibNumbers[i-1];
            fibNumbers.add(numberWanted);
        }
        
        return numberWanted;
    }
    
    /*
     * Sort an array(List) using bubble sort.
     * 
     * Parameters:
     * 	- numArray: The array to be sorted
     * 
     * Return:
     * 	- The sorted array.
     * */
    public static List<Integer> sortArray(List<Integer> numArray) {
        Integer len = numArray.size();
        
        for (Integer i = len-1; i >= 0; i--) {
            for (Integer j = 1; j <= i; j++) {
                if (numArray[j-1] > numArray[j]) {
                    Integer temp = numArray[j-1];
                    numArray[j-1] = numArray[j];
                    numArray[j] = temp;
                }
            }
        }
        
        return numArray;
    }
    
    /*
     * Calculate the factorial of n.
     * 
     * Paremeters: 
     * 	- n : The number to find the factorial of.
     * 
     * Return:
     * 	- The factorial of n.
     * 
     * */
    public static Integer factorial(Integer n) {
        if (n < 0) {
            return -1;
        } else if (n == 0) {
            return 1;
        } else {
            return (n * factorial(n-1));
        }
    }
    
    /*
     * Rotate an array to the left, n times.
     * 
     * Parameters: 
     * 	- arr : The array to be rotated
     * 	- n : The amount of times to rotate the array.
     * */
    public static List<Integer> rotateLeft(List<Integer> arr, Integer n) {
        Integer len = arr.size();
        Integer numOfRotations = Math.mod(n, len); // Reduce the amount of rotations since it becomes repetitive.
        
        if (len < 1) {
            return new List<Integer>{-1};
        } else if (len == 1) {
            return arr;
        } else {
            for (Integer i = 0; i < numOfRotations; i++) {
                arr.add(arr.remove(0));
            }
        }
        return arr;
    }
    
    /*
     * This method will check for balanced brackets.
     * 
     * The following brackets are balanced:
     * 	- ()
     * 	- (())
	 * 	- (({[{[]}]}))
	 * 
	 * The following brackets are not balanced:
	 * 	- (}
	 *  - ([[}]])
	 * 
	 * Parameters:
	 * 	- brackets : The brackets to be checked.
	 * 
	 * Boolean:
	 * 	- true if balanced, false if not
     * */
    public static Boolean balancedBrackets(String brackets) {
        List<String> bracketString = brackets.split('');					// Split brackets into a list of characters.
        List<String> openingBrackets = new List<String> {'(', '[', '{'};	
        List<String> closingBrackets = new List<String> {')', ']', '}'};
        List<String> bracketStack = new List<String>();						// Stack of opening brackets already seen.
        Integer len = brackets.length();
        System.debug('brackets: ' + brackets);
        System.debug('bracketString: ' + bracketString);
        
        if (brackets.isNumeric()){
            System.debug('Brackets: ' + brackets + ' contained a number. Therefore, it is not balanced.');
            return false;
        }
        if (len < 2) 
            return false;

        for (Integer i = 0; i < len; i++) {
            // Add to stack only if current bracket is an opening bracket.
            if (openingBrackets.contains(bracketString[i])) {
                bracketStack.add(bracketString[i]);
            } else {
                // If we reached a closing bracket and have not encountered an opening bracket, 
                if (bracketStack.size() == 0)
                    return false;
                
                System.debug('i, bracketStack: ' + i + ', ' + bracketStack);
                
                String top = bracketStack.remove(i-1);

                if (openingBrackets.indexOf(top) != closingBrackets.indexOf(bracketString[i])) {
                    return false;
                }
            }
        }
        
        if(bracketStack.size() > 0) 
            return false;
        
        return true;
    }
    
    public static void updateAccountSize() {
        List<Account> accs = [SELECT NumberOfEmployees, Size__c FROM Account];
	
        for(Account a : accs) {
            System.debug('a: ' + a);
            if(a.NumberOfEmployees < 1000){
                a.Size__c = 'small';
            } else if(a.NumberOfEmployees > 1000 && a.NumberOfEmployees < 10000){
                a.Size__c = 'medium';
            } else {
                a.Size__c = 'large';
            }
        }
        update accs;
    }
    
    public static void updateCALeads() {
        List<Lead> leads = [SELECT Id, Status, Description FROM Lead WHERE State = 'CA'];
        
        for (Lead l : leads) {
            l.Status = 'Closed - Not Converted';
            l.Description = 'We are no longer doing business in California.';
        }
        
        update leads;
    }
    
    public static void updateOpportunitiesPastClosedDate() {
        List<String> stageNamesToExclude = new List<String> {'Closed Won', 'Closed Lost'};
        List<Opportunity> opps = [SELECT ID, StageName FROM Opportunity WHERE CloseDate < TODAY AND StageName NOT IN :stageNamesToExclude];
        
        for (Opportunity opp : opps) {
            opp.StageName = 'Closed Lost';
        }
        
        update opps;
    }
}
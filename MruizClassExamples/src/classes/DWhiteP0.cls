public class DWhiteP0 {
    public static Integer fibonacci(Integer n){
        if (n <= 0){
            System.debug('Number must be positive');
            return -1;
        }
        if (n == 1)
            return 0;
        if (n == 2)
            return 1;
        Integer fminus2 = 0;
        Integer fminus1 = 1;
        Integer f;
        
        for (Integer i = 2; i < n; i++){
            f = fminus2 + fminus1;
            fminus2 = fminus1;
            fminus1 = f;
        }
        
        return f;
    }
    
    public static List<Integer> sortArray(List<Integer> numArray){
        // Copy numArray into new list to be sorted    
        List<Integer> sortedArray = numArray.clone(); 
        Integer sortedLength = 0; // Current length of the sorted portion of the list
        
        while (sortedLength < sortedArray.size()){
            Integer indexOfSmallest = sortedLength; // Holds the index of smallest unsorted value 
            
            // Iterate over unsorted portion of the list to find the smallest value
            // not yet sorted
            for (Integer i = sortedLength; i < sortedArray.size(); i++){
                if (sortedArray[i] < sortedArray[indexOfSmallest])
                    indexOfSmallest = i;
            }
            
            // Swap smallest value from unsorted portion of the array into the end of 
            // the sorted portion 
            Integer temp = sortedArray[sortedLength];
            sortedArray[sortedLength] = sortedArray[indexOfSmallest];
            sortedArray[indexOfSmallest] = temp;
            
            // Increment sortedLength
            sortedLength++;
        }
        
        return sortedArray;
    } 
    
    public static Integer factorial(Integer n){
        if (n < 0){
            System.debug('Number cannot be negative');
            return -1;
        }
        // Stop condition: Return 1 when n is 0
        if (n == 0){ 
            return 1;
        }
        return n * factorial(n-1); // Recursive call; n! = n*(n-1)!
    }
    
    public static list<Integer> rotateLeft(list<Integer> arr, Integer n){
        list<Integer> newList = new list<integer>();
        Integer length = arr.size();
        for (integer i = 0; i < length; i++)
            newList.add(arr[math.mod(i+n, length)]);
        
        return newList;
    }
    
    public static boolean balancedBrackets(string bracks){
        // Can't have balanced brackets if string 
        // has odd number of elements
        if (math.mod(bracks.length(), 2)==1){
            return false;
        }
        
        Integer length = bracks.length();
        
        // Stop condition: reached inner-most pair of brackets
        if (length == 2){
            if (isClosed(bracks))
                return true;
            else
                return false;
        }
        
        if (isClosed(bracks))
            // Recursively call function  on string without recently 
            // checked outer pair of brackets
            return balancedBrackets(bracks.substring(1, bracks.length()-1));
        else 
            return false;
    }
    public static void updateAccountSize(){
        List<Account> accs = [select NumberOfEmployees from Account];
        
        for (Account acc : accs){
            integer n = acc.NumberOfEmployees;
            if (n <= 1000)
                acc.Size__c = 'Small';
            else if (n > 1000 && n <= 10000)
                acc.Size__c = 'Medium';
            else
                acc.Size__c = 'Large';
        }
        
        update accs;
    }
    
    public static void updateCALeads() {
        List<Lead> leads = [select Address from Lead];
        
        for (Lead l : leads){
            if (l.Address.getState() == 'CA'){
                l.Status = 'Closed-Not Converted';
                l.Description = 'We are no longer doing business in California.';
            }
        }
        
        update leads;
    }
    
    
    
    public static void updateOpportunitiesPastClosedDate() {
        List<Opportunity> lostOpps = [select StageName from Opportunity 
                                      where CloseDate < TODAY 
                                      and StageName <> 'Closed Won' ];
        for (Opportunity opp : lostOpps)
            opp.stageName = 'Closed Lost';
        
        update lostOpps;
    }
    
    // Private helper method for checking if an opening bracket
    // is matched to its closing bracket
    private static boolean isClosed(string toCheck){
        List<Integer> chars = toCheck.getChars();
        integer open = chars[0];
        integer close = chars[toCheck.length()-1];
        switch on open{
            // 40 = (, 41 = )
            when 40{return (close == 41) ? true : false;}
            
            // 91 = [, 93 = ]
            when 91{return (close == 93) ? true : false;}
            
            // 60 = <, 62 = >
            when 60{return (close == 62) ? true : false;}
            
            // 123 = {, 125 = }
            when 123{return (close == 125) ? true : false;}
            
            when else {return false;}
        }
    }
    
    public static void listTest(List<Integer> myList){
        while (myList.size()>0){
            myList.remove(0);
        }
    }
}
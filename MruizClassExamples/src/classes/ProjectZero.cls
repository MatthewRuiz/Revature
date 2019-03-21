public class ProjectZero {
public static Integer fibonacci(Integer n) {
       integer x = 0;
       integer y = 1;
       integer next;

       for(Integer i = 1; i < n; i++){
           y=next;
           next+=y;
       }
       return next;
   }

    public static List<Integer> sortArray(List<Integer> numArray) {
           list<integer>array1 =new list<integer>();
           integer i, v1,v2,v3,v4,v5,v6,m1;
           array1.add(2);//0 index position
           array1.add(4);
           array1.add(5);//2
           array1.add(1);
           array1.add(3);//4
           array1.add(1);

            v1 = array1[0];
            v2 = array1[1];
            v3 = array1[2];
            v4 = array1[3];
            v5 = array1[4];
            v6 = array1[5];

            for(i=0;i<=6; i++){
               if (v1==1){
                   i=1;
               }  else if (v2==2){
                   i+=i++;
               }  else if (v3==3){
                   i+=i++;
               } else if (v4==4){
                   i+=i++;
               } else if (v5==5){
                   i+=i++;
               } else{
                   i+=i++;
               }
            }

           list<integer>sortarray1= new list<integer>();
           return sortarray1;
       }


   public static Integer factorial(Integer n) {
       Integer subtotal = 1;

       for(Integer i = 1; i <= n; i++){
           subtotal = subtotal*i;
       }
       return subtotal;
   }

   public static List<Integer> rotateLeft(List<Integer> arr, Integer n) {
       if(n > 5){
       for(Integer i = 0; i < arr.size(); i++){
          arr[i] = arr[i-(math.mod(n, 5))];
       }
       System.debug(arr);
       }
       else if(n == 4){
           arr[0] = arr[4];
           arr[1] = arr[0];
           arr[2] = arr[1];
           arr[3] = arr[2];
           arr[4] = arr[3];

       }
       else if(n == 3){
           arr[0] = arr[3];
           arr[1] = arr[4];
           arr[2] = arr[0];
           arr[3] = arr[1];
           arr[4] = arr[2];

       }
       else if(n == 2){
           arr[0] = arr[2];
           arr[1] = arr[3];
           arr[2] = arr[4];
           arr[3] = arr[0];
           arr[4] = arr[1];

       }
       else if(n == 1){
           arr[0] = arr[1];
           arr[1] = arr[2];
           arr[2] = arr[3];
           arr[3] = arr[4];
           arr[4] = arr[0];

       }
       else if(n == 0 || n == 5){
           arr[0] = arr[0];
           arr[1] = arr[1];
           arr[2] = arr[2];
           arr[3] = arr[3];
           arr[4] = arr[4];

       }
       return arr;
   }
   //public static Boolean balancedBrackets(String brackets) {}
   public static void updateAccountSize() {
       List<Account> AccountsToUpdate = new List<Account>();
       try{
       AccountsToUpdate = [SELECT Name, NumberOfEmployees, Size__c
                           FROM Account];
           for(Account acct : AccountsToUpdate){
               if(acct.NumberOfEmployees <= 1000)
                   acct.Size__c = 'Small';
               else if(acct.NumberOfEmployees > 1000 && acct.NumberOfEmployees <= 10000)
                   acct.Size__c = 'Medium';
               else if(acct.NumberOfEmployees > 10000)
                   acct.Size__c = 'Large';
           }
           update AccountsToUpdate;
           }catch(DMLException e){
           System.debug('An unexpected error has occurred');
           }
   }
   public static void updateCALeads() {
       List<Lead> caLead = new List<Lead>();
       caLead = [SELECT Name, Status, Address
                       FROM Lead
                       WHERE State LIKE 'CA' AND Status
                       LIKE 'Closed - Not Converted'];
   }
   public static void updateOpportunitiesPastClosedDate() {
       List<Opportunity> updateOpp = new List<Opportunity>();
       updateOpp = [SELECT CloseDate, StageName
                   FROM Opportunity
                   WHERE CloseDate < 2019-03-13 AND (NOT StageName LIKE 'Closed Won')];
       for(Opportunity opp : updateOpp){
           opp.StageName = 'Closed Lost';
       }
       update updateOpp;
   }
}
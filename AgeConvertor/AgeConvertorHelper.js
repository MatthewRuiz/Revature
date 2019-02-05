({
    inDays: function(dateOfBirth, today) {
        var todayTime = today.getTime();
        var dateOfBirthTime = dateOfBirth.getTime();
        var timeDifference = todayTime - dateOfBirthTime;
        
        return parseInt(timeDifference / (24*3600*1000));
   },

   inWeeks: function(dateOfBirth, today) {
       return Math.round((today - dateOfBirth) / (7 * 24 * 60 * 60 * 1000));
   },

   inMonths: function(dateOfBirth, today) {
       var dateOfBirthYear = dateOfBirth.getFullYear();
       var todayYear = today.getFullYear();
       var dateOfBirthMonth = dateOfBirth.getMonth();
       var todayMonth = today.getMonth();

       return (todayMonth + 12 * todayYear)-(dateOfBirthMonth + 12 * dateOfBirthYear);
   },

   inYears: function(d1, d2) {
       return d2.getFullYear()-d1.getFullYear();
   }
})
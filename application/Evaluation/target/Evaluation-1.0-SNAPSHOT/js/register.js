// αφορα το dropdown menu της επιλογης της ειδικοτητας

$(document).ready(function(){
    $("#IDsp").change(function(){
        $("#detail").show();
        var x = $(this).children("option:selected").val();
        $("#detail").val('');
        $("#detail > option[sub!='" + x + "']").hide();
        $("#detail > option[sub='" + x + "']").show();
    });
});


// αφορα την ημερομηνια - ωρα του footer

function myFunction() {
  alert("Hello! I am an alert box!");
}
 
  function getDateTime() {
    var now     = new Date(); 
    var year    = now.getFullYear();
    var month   = now.getMonth()+1; 
    var day     = now.getDate();
    var hour    = now.getHours();
    var minute  = now.getMinutes();
    var second  = now.getSeconds(); 
    if(month.toString().length == 1) {
         month = '0'+month;
    }
    if(day.toString().length == 1) {
         day = '0'+day;
    }   
    if(hour.toString().length == 1) {
         hour = '0'+hour;
    }
    if(minute.toString().length == 1) {
         minute = '0'+minute;
    }
    if(second.toString().length == 1) {
         second = '0'+second;
    }   
    var dateTime = 'Ημερομηνία: '+day+'/'+month+'/'+year+' || '+'Ώρα: '+hour+':'+minute+':'+second;   
     return dateTime;
}

// example usage: realtime clock
setInterval(function(){
    currentTime = getDateTime();
    document.getElementById("clock").innerHTML = currentTime;
}, 1000);


// αφορα το dropdown menu της επιλογης του βαθμου
$(document).ready(function(){
     $("#IDsp").change(function(){
         $("#rank").show();
         var x = $(this).children("option:selected").val();
         $("#rank").val('');
         $("#rank > option[sub!='" + x + "']").hide();
         $("#rank > option[sub='" + x + "']").show();
     });
 });

// αφορα το dropdown menu της επιλογης της μοναδας
$(document).ready(function(){
     $("#IDsp").change(function(){
         $("#battalion").show();
         var x = $(this).children("option:selected").val();
         $("#battalion").val('');
         $("#battalion> option[sub!='" + x + "']").hide();
         $("#battalion > option[sub='" + x + "']").show();
     });
 });


 function startTimer(duration, display) {
     var timer = duration, minutes, seconds;
     setInterval(function () {
         minutes = parseInt(timer / 60, 10);
         seconds = parseInt(timer % 60, 10);
 
         minutes = minutes < 10 ? "0" + minutes : minutes;
         seconds = seconds < 10 ? "0" + seconds : seconds;
 
         display.textContent = minutes + ":" + seconds;
 
         if (--timer < 0) {
             timer = duration;
         }
     }, 1000);
 }
 
 window.onload = function () {
     var fiftyMinutes = 60 * 50,
         display = document.querySelector('#time');
     startTimer(fiftyMinutes, display);
 };


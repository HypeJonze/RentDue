$(document).ready(function (){
  console.log("ayhan");
  $('#calendar').fullCalendar({
    events: 'properties.json'
  });
});
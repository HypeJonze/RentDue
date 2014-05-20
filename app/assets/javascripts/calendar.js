$(document).ready(function (){
  console.log("ayhan");
  $('#calendar').fullCalendar({
    height: 300,
    events: 'properties.json'
  });
});
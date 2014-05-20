$(document).ready(function (){
  console.log("ayhan");
  $('#calendar').fullCalendar({
    contentHeight: 250,
     windowResize:true,

       editable: true,
       defaultView: 'month',


       eventSources: [


        {

            description:'first description',
            url: 'properties.json', 
            
            color: 'lightblue', 
            textColor: 'black' 
        }

      ],
      eventRender: function(event, element)
    { 
          element.find('.fc-event-inner').append("<br/>" + event.address+"<br/>"+"$"+event.rent); 
    }

  });
});
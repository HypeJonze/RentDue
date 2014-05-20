$(document).ready(function (){
  console.log("ayhan");
  $('#calendar').fullCalendar({
    contentHeight: 200,
     windowResize:true,
     header: {
            left: 'prev, next today',
            center: 'title',
            right: 'month, basicWeek, basicDay'
        },

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
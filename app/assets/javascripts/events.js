$(function () {
  getEvents()

})

  function getEvents() {
    $("#getEvents").on("click", function(){
      $.get("/events.json", function(data){

        for(var key in data) {
          const id = data[key].id;
          const description = data[key].description;
          const link = `<a href="/events/${id}">Check out this Event</a>`
          $("#event-" + id + "-description").text(description);
          $("#event-" + id + "-link").html(link);
          $("#event-" + id).addClass("highlight");
        }
        $("#getEvents").hide();
        $("#eventDiv").append("<a href='http://localhost:3000/runner_events/new'>Set your Event</a>")
      })
    })
  }

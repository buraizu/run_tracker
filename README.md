Events Index

$(function() {
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
})

Runs Index

<script type="text/javascript" charset="utf-8">

  $(function() {
    $(".moreInfo").on("click", function() {
      var id = $(this).data("id");
      $.get("/runs/" + id + ".json", function(run) {
        $("#run-" + id + "-time").html(`Time: ${run["time"]}`);
        $("#run-" + id + "-review").html(`Review: ${run["review"]}`);
        $("#run-" + id + "-rating").html(`Rating: ${run["rating"]}`);
      });
    });
  });

</script>

New Run
<script type="text/javascript" charset="utf-8">

  class JSRun {
    constructor(course, distance, time, review, rating) {
      this.course = course;
      this.distance = distance;
      this.time = time;
      this.review = review;
      this.rating = rating;
    }
  }

  JSRun.prototype.pace = function() {
    let timeInHours = this.time / 60;
    return (this.distance / timeInHours).toFixed(2);
  }



</script>

$(function() {
  $('form').submit(function(event) {
    event.preventDefault();

    const values = $(this).serialize();

    const posting = $.post('/runs', values);

    posting.done(function(data) {
      const course = data["course"];
      const distance = data["distance"];
      const time = data["time"];
      const review = data["review"];
      const rating = data["rating"];
      const run = new JSRun(course, distance, time, review, rating)

      $("#postResult").addClass("highlight");
      $("#runCourse").text(`Course: ${run.course}`);
      $("#runDistance").text(`Distance: ${run.distance}`);
      $("#runTime").text(`Time: ${run.time}`);
      $("#runReview").text(`Review: ${run.review}`);
      $("#runRating").text(`Rating: ${run.rating}`);
      $("#runPace").text(`Average pace: ${run.pace()} miles per hour!`);

      $("form").each(function(){
        this.reset();
      });
    });
  });
});

Run Tracker

Run_Tracker is an app written for keeping track of your run training and run events. Use it to log the important details of your training runs, or chronicle the details of the running events you complete.

GETTING STARTED

Clone a copy of the app on the Github repository, https://github.com/buraizu/run_tracker.
From a terminal window, navigate into the project directory. Enter 'bundle install' to download the necessary gems. Next, type 'rake db:migrate'. When that process is complete, type 'bin/rails s' to start up a local Rails server. Finally, navigate to http://localhost:3000.

VERSIONING

Ruby Version: 2.3.3

AUTHOR

Bryce headline

LICENSE

This project is licensed under the MIT License

CONTRIBUTING

If you wish to contribute to this repository, please first discuss the change you wish to make via issue, email, or any other method with the author before making a change.

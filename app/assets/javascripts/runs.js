$(function () {
  newRun()
})



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





function newRun() {
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
};

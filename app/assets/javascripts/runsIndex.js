$(function () {
  runsIndex()
})

  const runsIndex = () => {
    $(".moreInfo").on("click", function() {
      var id = $(this).data("id");
      $.get("/runs/" + id + ".json", function(run) {
        $("#run-" + id + "-time").html(`Time: ${run["time"]}`);
        $("#run-" + id + "-review").html(`Review: ${run["review"]}`);
        $("#run-" + id + "-rating").html(`Rating: ${run["rating"]}`);
      });
    });
  };

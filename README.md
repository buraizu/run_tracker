runs/index ~!!
<div class="container">
  <div class="feature">

    <h1>Runs</h1>

    <% @runs.each do |run| %>
      <div class="highlight">
        <h3>Nice job, you ran the <%= run.course %> course!</h3>
        <p>Runner: <%= Runner.find_by(id: run.runner_id).username %></p>

        <p>Distance: <%= run.distance %></p>
        <p>Time: <%= run.time %></p>
        <p>Rating: <%= run.rating %></p>
        <p>Review: <%= run.review %></p>

        <p>Something not right? <%= link_to "Edit", edit_run_path(run.id) %></p>
      </div>
    <% end %>

    <h3><%= link_to "Home", runner_path(current_runner.id) %></h3>

    <br />

    <%= form_tag ({controller: 'sessions', action: 'destroy', method: 'post'}) do %>
      <input type=submit value='logout'>
    <% end %>

  </div>
</div>

runners/show ~ !!
<h2>Your longest training run was: <%= @runner.runs.longest.distance %> miles</h2>

Run_Tracker is an app written for keeping track of your run training and run events!

Ruby Version: 2.3.3

To make use of this app, clone the repository at https://github.com/buraizu/run_tracker

Open the project and run 'bundle install' to ensure you have the required gems.

Use your terminal to change directories into the project folder, then type 'bin/rails s' to start a local server.

Just like that, you're off to the races!

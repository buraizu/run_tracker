Runner SHOW page

<h2><%= @runner.username %></h2>

<p><%= @runner.first_name %> <%= @runner.last_name %></p>

<% if @runner.goals.present? %>
  <h3>Some past goals, or, who knows, maybe you're still working on them.</h3>
  <% @runner.goals.each do |g| %>
    <p><%= g.description %></p>
  <% end %>
<% end %>
<h3>Your Current Goal</h3>
<%= current_goal %>
<p>Want to change it? <%= link_to "here", new_goal_path %></p>

<%= form_for @runner do |f| %>
  Goals:
  <ul>
    <%= f.fields_for :goals do |goals_form| %>
      <li>
        <%= goals_form.label :description %>
        <%= goals_form.text_field :description %>
        <%= goals_form.submit %>
      </li>
    <% end %>
  </ul>
<% end %>

<br />

<h3>Log your run</h3>

<%= form_for @runner.runs.build do |f| %>
  <%= f.hidden_field :runner_id %>
  <%= f.label "Course" %>
  <%= f.text_field :course %>
  <br />
  <%= f.label "Review" %>
  <%= f.text_area :review %>
  <br />
  <%= f.label "Distance" %>
  <%= f.text_field :distance %>
  <br />
  <%= f.label "Rating" %>
  <%= f.text_field :rating %>
  <br />
  <%= f.label "Difficulty" %>
  <%= f.text_field :difficulty %>
  <h4></h4>
  <%= f.collection_select(:goal_id, Goal.all, :id, :description) %>

  <%= f.submit %>
<% end %>

<br />

<ul>
  <% @runner.runs.each do |r| %>
    <li><%= r.course %></li>
    <% if r.goal.present? %>
      <li><%= r.goal.description %></li>
    <% end %>
  <% end %>
</ul>


<p><%= link_to "Log Out", "/logout", method: :post %></p>






<%= form_for current_goal do |f| %>
  <%= f.collection_select(:id, Goal.all, :id, :description, include_blank: "Select a goal") %>
  <%= f.submit %>
<% end %>




Rails Project Checklist of Requirements

A summary of the application

<!-- Run_Tracker will let runners keep track of their runs and running goals.  Users can document their runs,
assign them to their goals, and mark them off as completed. -->

What will your models and associations be and why? You will need a has_many and belongs_to relationship as well as a many to many relationship.

<!-- There are models for Runners, Runs, and Goals.  A Runner has many runs and a run belongs to a runner.  A runner has many goals, through runs.  A goal has many runners, through runs. -->

How will you implement a user submittable attribute on the join table of the many to many relationship?

<!-- Users will be able to submit the details of their run (distance, rating, etc.) through the New Run form. -->

What it is an ActiveRecord scope method and what is your implementation plan?

<!-- A scope method represents a database query that can be used as a method.
A couple ideas for scope methods in my app are:
Run.long_distance finds runs over a particular distance
Goal.accomplished finds all of the completed goals --> Must accept user_id in order to list user

What validations will you have for your models?

<!-- Runners will have validations for presence of name, uniqueness of username, and password.
Runs will have validations that all fields were entered with appropriate datatypes.
Goals will have validations that all fields have been entered with appropriate datatypes. -->

How will you implement an authentication system?

<!-- Password authentication will be handled with has_secure_password.  Helper methods will ensure
that protected resources are only shown to the correct users. -->

What 3rd party login service will you use?

<!-- I plan to use Github. -->

With the way your models are setup what nested routes will you use to meet the requirement?

• You must include a nested new route with form that relates to the parent resource

<!-- The "new run" form is nested within the Runners show page. Logging a run will automatically
assign the runner_id. -->

• You must include a nested index or show route

<!-- The Runners show page features an index view of all the runner's goals. -->

<%= link_to "Log Out", "/logout", method: :post %>
<br />
<%= link_to "See attractions", "/attractions", method: :get %>


You must include and make use of a nested resource with the appropriate RESTful URLs.

• You must include a nested new route with form that relates to the parent resource

• You must include a nested index or show route

# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

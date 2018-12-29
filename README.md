<%= form_for @runner do |f| %>

  <%= f.label "Goal description" %>
  <%= f.fields_for :goals, Goal.new do |goal_builder| %>
    <%= goal_builder.text_field :description %>
  <% end %>
  <br />
  <%= f.submit %>

<% end %>



<%= f.label "Goal description" %>
<br />
<%= collection_select :goal, :description, Goal.all, :description, :description %>

<p>Or add a new goal: </p>
<%= f.label :description %>
<%= f.text_field :description %>
<br />
<%= f.submit %>



<%= form_tag(controller: "sessions", action: "create", method: "post") do %>

  <br />
  <%= label_tag("Password") %>
  <br />
  <%= password_field_tag(:password) %>
  <br />
  <%= submit_tag("Sign In") %>
<% end %>

<p><%= link_to "Set a new goal", "/goals/new", method: :get %></p>

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

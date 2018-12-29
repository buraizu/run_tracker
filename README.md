
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

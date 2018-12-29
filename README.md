
<%= form_tag(controller: "sessions", action: "create", method: "post") do %>
  <%= collection_select :runner, :username, Runner.all, :username, :username %>
  <br />
  <%= label_tag("Password") %>
  <br />
  <%= password_field_tag(:password) %>
  <br />
  <%= submit_tag("Sign In") %>
<% end %>



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

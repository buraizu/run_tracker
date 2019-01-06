<h3><%= Runner.find_by(id: @run.runner_id).username %></h3>

<%= form_for @run do |f| %>

  <%= f.hidden_field :runner_id %>
  <%= f.label :course %>
  <%= f.text_field :course %>
  <br />
  <%= f.label :distance %>
  <%= f.text_field :distance %>
  <br />
  <%= f.label "Time (in minutes)" %>
  <%= f.text_field :time %>
  <br />
  <%= f.label :review %>
  <%= f.text_area :review %>
  <br />
  <%= f.label :rating %>
  <%= f.text_field :rating %>
  <br />
  <%= f.submit %>
<% end %>




def current_event
  if current_runner.runner_events.present?
    current_runner.runner_events.last.event
  else

  end
end


if params[:runner_id].present? && current_runner.id == params[:runner_id].to_i

def login_required
  if !logged_in
    redirect_to login_path
  end
end


  scope :by_rating, -> (rating) { select(*).where("rating = ?", rating) }

def is_logged_in
  session[:runner_id].present?
end

def current_runner
  Runner.find_by(id: session[:runner_id])
end






def create
  binding.pry
  @runner = Runner.find_or_create_by(id: auth['uid']) do |u|
  u.username = auth['info']['name']

  end
end



<ActionController::Parameters
{"code"=>"4e1ec672e8f6e3eb961b",
  "state"=>"aed03fb6fe36aacc050653802a7d443da5db22f6b88f2606",
  "controller"=>"sessions",
  "action"=>"create"}
  permitted: false>



# Original Create Action

def create
  runner_event = RunnerEvent.new(runner_event_params)
  runner_event.runner_id = current_runner.id
  if runner_event.save
    redirect_to runner_path(current_runner.id)
  else
    render :new
  end
end

# Omniauth Example Create Action

def create
  @runner = Runner.find_or_create_by(id: auth['uid']) do |u|
  u.username = auth['info']['name']
end


validates :finish_time, numericality: {only_integer: true}
validates :completed, presence: true


<h3>First, set an event</h3>

<%= form_for @event do |f| %>
  <%= f.label "Check if your event exists here" %>
  <br />
  <%= f.collection_select(:id, Event.all, :id, :description, include_blank: "Select an event") %>
  <br />
  <%= f.label "Or, create a new event" %>
  <%= f.text_field :description %>
  <br />
  <%= f.submit %>

<% end %>




<%= f.collection_select(:id, Event.all, :id, :description, include_blank: "Select an event") %>
<br />



<%= link_to "Set your goal here", new_runner_goal_path %>

  <%= f.collection_select(:goal_id, Goal.all, :id, :description, include_blank: "Select a goal") %>









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

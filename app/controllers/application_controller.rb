class ApplicationController < ActionController::Base
  helper_method :is_logged_in
  helper_method :current_runner
  helper_method :current_event
  helper_method :current_event_description
  helper_method :event_completed
  helper_method :completed_by
  helper_method :completed_time
  helper_method :valid_update_params

  def login_required
    if !logged_in
      redirect_to login_path
    end
  end

  def logged_in
    !!current_runner
  end

  def current_runner
    @current_runner ||= Runner.find_by(id: session[:runner_id])
  end

  def current_event
    if current_runner.runner_events.present?
      current_runner.runner_events.last.event
    else

    end
  end

  def current_event_description
    if current_runner.runner_events.present?
      "You're currently training for: #{current_runner.runner_events.last.event.description}"
    else
      "Follow the link below to set your next event"
    end
  end

  def event_completed(runner_event)
    if runner_event.completed == 0 || runner_event.completed == nil
      "Event still to complete: #{Event.find_by(id: runner_event.event_id).description}"
    else
      "You've completed #{Event.find_by(id: runner_event.event_id).description}!"
    end
  end

  def completed_by(event)
    runners = []
    event.runners.each do |r|
      r.runner_events.each do |r_e|
        if r_e.completed != nil && r_e.event_id == event.id
          runners << r
        end
      end
    end
    runners
  end

  def completed_time(runner, event)
    race_time = nil
    runner.runner_events.each do |r_e|
      if r_e.event_id == event.id && r_e.completed
        race_time = r_e.finish_time
      end
    end
    race_time
  end

  def valid_update_params(runner_event_params)
    if runner_event_params[:completed] == "1" && !!runner_event_params[:finish_time].match(/\A\d+\z/)
      true
    else
      false
    end
  end

end

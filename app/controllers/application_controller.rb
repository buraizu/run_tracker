class ApplicationController < ActionController::Base
  helper_method :is_logged_in
  helper_method :current_runner
  helper_method :current_event
  helper_method :current_event_description
  helper_method :event_completed

  def is_logged_in
    session[:runner_id].present?
  end

  def current_runner
    Runner.find_by(id: session[:runner_id])
  end

  def current_event
    if current_runner.runner_events.present?
      current_runner.runner_events.last.event
    else

    end
  end

  def current_event_description
    if current_runner.runner_events.present?
      current_runner.runner_events.last.event.description
    else
      "Follow the link below to set your next event"
    end
  end

  def event_completed(runner_event)
    
    if runner_event.completed == 0 || runner_event.completed == nil
      "You haven't completed #{Event.find_by(id: runner_event.event_id).description} yet!"
    else
      "Congratulations, you've completed #{Event.find_by(id: runner_event.event_id).description}!"
    end
  end

end

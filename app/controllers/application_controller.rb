class ApplicationController < ActionController::Base
  helper_method :is_logged_in
  helper_method :current_runner
  helper_method :current_goal

  def is_logged_in
    session[:runner_id].present?
  end

  def current_runner
    Runner.find_by(id: session[:runner_id])
  end

  def current_goal
    if current_runner.goals.present?
      current_runner.runs.last.goal
    else
      "Create a new goal"
    end
  end

end

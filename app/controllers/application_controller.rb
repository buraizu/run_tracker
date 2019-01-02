class ApplicationController < ActionController::Base
  helper_method :is_logged_in
  helper_method :current_runner
  helper_method :current_goal
  helper_method :current_goal_description

  def is_logged_in
    session[:runner_id].present?
  end

  def current_runner
    Runner.find_by(id: session[:runner_id])
  end

  def current_goal
    if current_runner.runs.present?
      current_runner.runs.last.goal
    else

    end
  end

  def current_goal_description
    if current_runner.runs.present?
      current_runner.runs.last.goal.description
    else
      "Set your goal when you log your first run!"
    end
  end

end

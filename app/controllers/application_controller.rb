class ApplicationController < ActionController::Base
  helper_method :is_logged_in
  helper_method :current_runner
  helper_method :current_goal
  helper_method :current_goal_description
  helper_method :goal_completed

  def is_logged_in
    session[:runner_id].present?
  end

  def current_runner
    Runner.find_by(id: session[:runner_id])
  end

  def current_goal
    if current_runner.runner_goals.present?
      current_runner.runner_goals.last.goal
    else

    end
  end

  def current_goal_description
    if current_runner.runner_goals.present?
      current_runner.runner_goals.last.goal.description
    else
      "Set your goal when you log your first run!"
    end
  end

  def goal_completed(runner_goal)
    if runner_goal.completed == 0
      "You haven't completed #{Goal.find_by(id: runner_goal.goal_id).description} yet!"
    else
      "Congratulations, you've completed #{Goal.find_by(id: runner_goal.goal_id).description}!"
    end
  end

end

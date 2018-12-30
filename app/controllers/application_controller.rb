class ApplicationController < ActionController::Base
  helper_method :is_logged_in
  helper_method :current_runner

  def is_logged_in
    session[:runner_id].present?
  end

  def current_runner
    Runner.find_by(id: session[:runner_id])
  end

end

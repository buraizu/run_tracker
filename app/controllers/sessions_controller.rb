class SessionsController < ApplicationController

  def new

  end

  def create
    runner = Runner.find_by(username: params[:username])
    return head(:forbidden) unless runner.authenticate(params[:password])
    session[:runner_id] = runner.id
    redirect_to runner_path(runner.id)
  end

  def destroy
    session.delete :runner_id
    redirect_to "/"
  end

end

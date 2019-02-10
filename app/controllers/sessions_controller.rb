class SessionsController < ApplicationController

  def new
  end

  def create
   if auth_hash = request.env["omniauth.auth"]
     @runner = Runner.find_or_create_by_omniauth(auth_hash)
     session[:runner_id] = @runner.id
     redirect_to runner_path(@runner.id)
   else
     @runner = Runner.find_by(username: params[:username])
      if @runner && @runner.authenticate(params[:password])
        session[:runner_id] = @runner.id
        redirect_to runner_path(@runner.id)
      else
        flash[:notice] = "Invalid username or password"
        render:new
      end
    end
  end

  def destroy
    session.delete :runner_id
    redirect_to "/"
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end

end

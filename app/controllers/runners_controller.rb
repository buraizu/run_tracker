class RunnersController < ApplicationController

  def index
    @runners = Runner.all
  end

  def new
    @runner = Runner.new
  end

  def create
    runner = Runner.new(runner_params)
    if runner.valid?
      runner.save
      session[:runner_id] = runner[:id]
      redirect_to "/runners/#{runner.id}"
    else
      redirect_to "/"
    end
  end

  def show
    @runner = Runner.find_by(id: params[:id])
  end

  private

    def runner_params
      params.require(:runner).permit(:first_name, :last_name, :username, :password)
    end

end

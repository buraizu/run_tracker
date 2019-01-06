class RunnersController < ApplicationController
  before_action :check_privileges, except: [:new, :create]

  def new
    @runner = Runner.new
  end

  def create
    @runner = Runner.new(runner_params)
    if @runner.valid?
      @runner.save
      session[:runner_id] = @runner[:id]
      redirect_to runner_path(@runner.id)
    else
      render :new
    end
  end

  def show
    @runner = Runner.find_by(id: params[:id])
    if current_runner.id != @runner.id
      redirect_to "/", notice: "You don't have permission to be here"
    end
  end

  private

    def runner_params
      params.require(:runner).permit(:username, :password)
    end

end

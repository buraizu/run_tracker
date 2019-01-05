class RunsController < ApplicationController
  before_action :check_privileges

  def index
    if params[:runner_id].present? && current_runner.id == params[:runner_id].to_i
      @runs = Runner.find_by(id: params[:runner_id]).runs
    else
      redirect_to "/", notice: "You don't have permission to be here"
    end
  end

  def new
    if params[:runner_id].present? && current_runner.id == params[:runner_id].to_i
      @run = Run.new(runner_id: params[:runner_id])
    else
      redirect_to "/", notice: "You don't have permission to be here"
    end
  end

  def create
    @run = Run.new(run_params)
    if @run.valid? && @run.save
      redirect_to run_path(@run.id)
    else
      render :new
    end
  end


  def show
    @run = Run.find_by(id: params[:id])
    if current_runner.id != @run.runner_id
      redirect_to "/", notice: 'You dont have permission to be here'
    end
  end

  private

    def run_params
      params.require(:run).permit(:distance, :time, :course, :review, :rating, :runner_id)
    end

end

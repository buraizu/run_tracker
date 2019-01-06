class RunsController < ApplicationController
  before_action :check_privileges

  def index
    if correct_runner
      @runs = Runner.find_by(id: params[:runner_id]).runs
      @runner = Runner.find_by(id: params[:runner_id])
    else
      redirect_to "/", notice: "You don't have permission to be here"
    end
  end

  def new
    if correct_runner
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
      redirect_to "/", notice: "You don't have permission to be here"
    end
  end

  def edit
    if current_runner.id == Run.find_by(id: params[:id]).runner_id
      @run = Run.find_by(id: params[:id])
    else
      redirect_to "/", notice: "You don't have permission to be here"
    end
  end

  def update
    @run = Run.find_by(id: params[:id])
    if @run.runner_id == current_runner.id
      @run.update(run_params)
      if @run.save
        redirect_to run_path(@run)
      else
        render :edit
      end
    else
      redirect_to "/", notice: "You don't have permission to be here"
    end
  end

  private

    def run_params
      params.require(:run).permit(:distance, :time, :course, :review, :rating, :runner_id)
    end

    def correct_runner
      params[:runner_id].present? && current_runner.id == params[:runner_id].to_i
    end

end

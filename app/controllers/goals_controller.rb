class GoalsController < ApplicationController

  def index
    @goals = Goal.all
  end

  def new
    @goal = Goal.new
  end

  def create
    raise params.inspect
  end

  def show
    @goal = Goal.find_by(id: params[:id])
  end

  def create
    goal = Goal.new(goal_params)
    if goal.valid?
      goal.save
      redirect_to runner_path(current_runner)
    else
      redirect_to "/goals/new"
    end
  end

  def edit
    if params[:runner_id]
      runner = Runner.find_by(id: params[:runner_id])
      if runner.nil?
        redirect_to runners_path, alert: "Runner not found."
      else
        @run = runner.runs.find_by(id: params[:id])
        redirect_to runner_runs_path(runner), alert: "Run not found." if @run.nil?
      end
    else
      @run = Run.find(params[:id])
    end
  end

  private

    def goal_params
      params.require(:goal).permit(:description, :completed)
    end

end

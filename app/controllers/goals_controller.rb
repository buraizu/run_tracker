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

  private

    def goal_params
      params.require(:goal).permit(:description, :completed)
    end

end

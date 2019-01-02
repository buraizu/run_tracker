class GoalsController < ApplicationController

  def index

    if params[:runner_id]
      @goals = Runner.find_by(id: params[:runner_id]).goals
    else
      @goals = Goal.all
    end
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

    @goal = Goal.find_by(id: params[:id])
  end

  def update
  
    @goal = Gaol.find_by(id: params[:id])
    @goal.update(goal_params)
    if @goal.save
      redirect_to @goal
    else
      render :edit
    end
  end

  private

    def goal_params
      params.require(:goal).permit(:description, :completed)
    end

end

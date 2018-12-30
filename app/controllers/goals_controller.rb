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
      current_runner.goals << goal
      redirect_to "/runners/#{current_runner.id}"
    else
      redirect_to "/goals/new"
    end
  end

  private

    def goal_params
      params.require(:goal).permit(:description, :completed)
    end

end

# "goal"=>{"id"=>"1", "description"=>"run a 50k"}  With new goal entered

# "goal"=>{"id"=>"1", "description"=>"run a 2k"} With both options selected.

class RunnerGoalsController < ApplicationController

  def new
    @runner_goal = RunnerGoal.new
  end

  def create
    runner_goal = RunnerGoal.new(runner_goal_params)
    runner_goal.runner_id = current_runner.id
    if runner_goal.save
      redirect_to runner_path(current_runner.id)
    else
      render :new
    end
  end

  private

    def runner_goal_params
      params.require(:runner_goal).permit(:runner_id, :goal_id, :completed)
    end

end

class RunsController < ApplicationController

  def index
    @runs = Run.all
  end

  def new
    if params[:runner_id].present? && Runner.find_by(id: params[:runner_id])
      @run = Run.new(runner_id: params[:runner_id])
    else
      @run = Run.new
    end
  end

  def create
    run = Run.new(run_params)
    run.goal_id = current_goal.id
    if run.save
      redirect_to run_path(run.id)
    else
      redirect_to new_run_path
    end
  end


  def show
    @run = Run.find_by(id: params[:id])
  end

  private

    def run_params
      params.require(:run).permit(:distance, :time, :course, :review, :rating, :difficulty, :runner_id, :goal_id)
    end

end

# "run"=>
# {"runner_id"=>"2",
#   "course"=>"Greenlake",
#   "distance"=>"4",
#   "time"=>"2",
#   "review"=>"so so run",
#   "rating"=>"5",
#   "difficulty"=>"5"}

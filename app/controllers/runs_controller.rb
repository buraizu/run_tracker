class RunsController < ApplicationController

  def index
    if params[:runner_id].present? && Runner.find_by(id: params[:runner_id])
      @runs = Runner.find_by(id: params[:runner_id]).runs
    else
      @runs = Run.all
    end
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
    if run.save
      redirect_to run_path(run.id)
    else

    end
  end


  def show
    @run = Run.find_by(id: params[:id])

  end

  private

    def run_params
      params.require(:run).permit(:distance, :time, :course, :review, :rating, :runner_id)
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

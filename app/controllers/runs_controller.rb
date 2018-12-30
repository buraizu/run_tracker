class RunsController < ApplicationController

  def index
    @runs = Run.all
  end

  def new
    raise params.inspect
  end

  def create
    run = Run.new(run_params)
    if run.valid?
      run.save
      redirect_to "/runs/#{run.id}"
    end
  end

  def show
    @run = Run.find_by(id: params[:id])
  end

  private

    def run_params
      params.require(:run).permit(:distance, :course, :review, :rating, :difficulty, :runner_id, :goal_id)
    end

end


# "run"=>
# {"runner_id"=>"1",
#   "course"=>"Shoreview",
#   "review"=>"Hilly trails",
#   "distance"=>"12",
#   "rating"=>"7",
#    "difficulty"=>"8",
#    "goal_id"=>"1"}

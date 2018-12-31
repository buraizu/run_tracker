class RunsController < ApplicationController

  def index
    @runs = Run.all
  end

  def new


      @run = Run.new(runner_id: params[:runner_id])

  end

  def create


  end

  def show
    @run = Run.find_by(id: params[:id])
  end

  private

    def run_params
      params.require(:run).permit(:distance, :time, :course, :review, :rating, :difficulty, :runner_id, :goal_id)
    end

end

# {"controller"=>"runs", "action"=>"new", "runner_id"=>"5"}

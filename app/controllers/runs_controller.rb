class RunsController < ApplicationController

  def index
    @runs = Run.all
  end

  def new

  end

  def create

  end

  def show
    @run = Run.find_by(id: params[:id])
  end

  private

    def run_params
      params.require(:run).permit(:distance, :course, :description, :rating, :difficulty, :runner_id, :goal_id)
    end

end

# def runner_params
#   params.require(:runner).permit(:first_name, :last_name, :username, :password)
# end

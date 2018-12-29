class GoalsController < ApplicationController

  def index
    @goals = Goal.all
  end

  def show
    @goal = Goal.find_by(id: params[:id])
  end

  def create
    raise params.inspect
  end

end

 "goal"=>{"description"=>"Run a 5k"}, "commit"=>"Create Goal", "controller"=>"goals", "action"=>"create"} permitted: false>

class GoalsController < ApplicationController

  def index
    @goals = Goal.all
  end

  def new

  end

  def create
    raise params.inspect
  end

  def show
    @goal = Goal.find_by(id: params[:id])
  end

  def create
    raise params.inspect
  end

end

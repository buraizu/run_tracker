class RunnersController < ApplicationController

  def index
    @runners = Runner.all
  end

  def show
    @runner = Runner.find_by(id: params[:id])
  end

end

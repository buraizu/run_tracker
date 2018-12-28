class FollowupsController < ApplicationController

  def index
    @followups = Followup.all
  end

  def show
    @followup = Followup.find_by(id: params[:id])
  end

end

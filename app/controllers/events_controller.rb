class EventsController < ApplicationController
  before_action :check_privileges

  def index
    @events = Event.all
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @events }
    end
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find_by(id: params[:id])
    @finishers = completed_by(@event.runners)

    respond_to do |format|
      format.html { render :show }
      format.json { render json: @finishers }
    end
  end

  def create
    @event = Event.new(event_params)
    if @event.valid?
      @event.save
      redirect_to new_runner_event_path
    else
      render :new
    end
  end

  def edit
    @event = Event.find_by(id: params[:id])
  end

  def update

    @event = Event.find_by(id: params[:id])
    @event.update(event_params)
    if @goal.save
      redirect_to @goal
    else
      render :edit
    end
  end

  def leaderboard
    @events = Event.all

  end

  private

    def event_params
      params.require(:event).permit(:description)
    end

    def completed_by(runners)
      finished_events = []
      runners.each do |runner|
        runner.runner_events.each do |r_e|
          if r_e.completed != nil && r_e.event_id == @event.id
            finished_events << r_e
          end
        end
      end
      finished_events
    end

end

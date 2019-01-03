class EventsController < ApplicationController

  def index

    if params[:runner_id]
      @events = Runner.find_by(id: params[:runner_id]).events
    else
      @events = Event.all
    end
  end

  def new
    @event = Event.new
  end

  def create
    raise params.inspect
  end

  def show
    @event = Event.find_by(id: params[:id])
  end

  def create

    event = Event.new(event_params)

    if event.valid?
      event.save
      redirect_to runner_path(current_runner)
    else
      redirect_to "/events/new"
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

  private

    def event_params
      params.require(:event).permit(:description)
    end

end

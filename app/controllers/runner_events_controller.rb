class RunnerEventsController < ApplicationController

  def new
    @runner_event = RunnerEvent.new
  end

  def index
    @events = current_runner.events
  end

  def show
    @runner_event = RunnerEvent.find_by(id: params[:id])
    @event = Event.find_by(id: @runner_event.event_id)
  end

  def create
    runner_event = RunnerEvent.new(runner_event_params)
    runner_event.runner_id = current_runner.id
    if runner_event.save

      redirect_to runner_path(current_runner.id)
    else

      render :new
    end
  end

  def update

    @runner_event = RunnerEvent.find_by(id: params[:id])

    if runner_event_params[:completed] != "1" || runner_event_params[:finish_time] == "" || !runner_event_params[:finish_time].to_i
      redirect_to runner_events_path
    else @runner_event.update(runner_event_params)
      if @runner_event.save
        redirect_to runner_event_path(@runner_event.id)
      else
        render :new
      end
    end
  end

  private

    def runner_event_params
      params.require(:runner_event).permit(:runner_id, :event_id, :completed, :finish_time)
    end

end

# "runner_event"=>{"completed"=>"1", "finish_time"=>""}

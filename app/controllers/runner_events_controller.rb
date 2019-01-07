class RunnerEventsController < ApplicationController
  before_action :check_privileges

  def new
    @runner_event = RunnerEvent.new
  end

  def index
    @events = current_runner.events
  end

  def show
    @runner_event = RunnerEvent.find_by(id: params[:id])
    if @runner_event.runner_id == current_runner.id
      @event = Event.find_by(id: @runner_event.event_id)
    else
      redirect_to "/", notice: "You don't have permission to view this event"
    end
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

  def edit
    @runner_event = RunnerEvent.find_by(id: params[:id])
  end

  def update
    @runner_event = RunnerEvent.find_by(id: params[:id])
    if !valid_update_params(runner_event_params)
      flash[:notice] = "Must check 'completed' and provide time in minutes"
      redirect_to edit_runner_event_path(@runner_event.id)
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

    def valid_update_params(runner_event_params)
      if runner_event_params[:completed] == "1" && !!runner_event_params[:finish_time].match(/\A\d+\z/)
        true
      else
        false
      end
    end

end

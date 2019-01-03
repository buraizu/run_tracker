class RunnerEventsController < ApplicationController

  def new
    @runner_event = RunnerEvent.new
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

  private

    def runner_event_params
      params.require(:runner_event).permit(:runner_id, :event_id, :completed)
    end

end

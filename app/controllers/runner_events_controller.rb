class RunnerEventsController < ApplicationController

  def new
    @runner_event = RunnerEvent.new
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
    @runner_event.update(runner_event_params)
    if @runner_event.save
      redirect_to runner_event_path(@runner_event.id)
    else
      redirect_to runner_path(current_runner.id)
    end
  end

  private

    def runner_event_params
      params.require(:runner_event).permit(:runner_id, :event_id, :completed, :finish_time)
    end

end

# "runner_event"=>{"completed"=>"1"},

# def update
#     @song = Song.find(params[:id])
#
#     @song.update(song_params)
#
#     if @song.save
#       redirect_to @song
#     else
#       render :edit
#     end
#   end

class SchedulesController < ApplicationController
  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      flash[:success] = "schedule Added Successfully"
      redirect_to root_path
    else
      render "new"
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(:route_id, :bus_id,:journey_date)
  end
end

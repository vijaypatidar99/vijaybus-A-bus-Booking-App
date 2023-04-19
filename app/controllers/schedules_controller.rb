class SchedulesController < ApplicationController
  before_action :sanitize_date_params, only: [:create,:update]
  
  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      flash[:success] = "schedule Added Successfully"
      @schedule.bus.update(starting_city: @schedule.route.from, destination_city: @schedule.route.to)
      redirect_to root_path
    else
      render "new"
    end
  end

  private

  def sanitize_date_params
    params[:schedule][:dates].delete("")
  end

  def schedule_params
    params.require(:schedule).permit(:route_id, :bus_id, dates: [])
  end
end

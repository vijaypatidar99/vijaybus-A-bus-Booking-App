class SchedulesController < ApplicationController
  before_action :sanitize_date_params, only: [:create, :update]
  authorize_resource

  def index
    @schedules = Schedule.paginate(page: params[:page])
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      flash[:alert] = "schedule Added Successfully"
      @schedule.bus.update(starting_city: @schedule.route.from, destination_city: @schedule.route.to)
      redirect_to root_path
    else
      render "new"
    end
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_params)
      flash[:alert] = "Schedule updated"
      redirect_to root_path
    else
      render "edit"
    end
  end

  def destroy
    Schedule.find(params[:id]).destroy
    flash[:alert] = "Schedule deleted"
    redirect_to request.referrer
  end

  private

  def sanitize_date_params
    params[:schedule][:dates].delete("")
  end

  def schedule_params
    params.require(:schedule).permit(:route_id, :bus_id, dates: [])
  end
end

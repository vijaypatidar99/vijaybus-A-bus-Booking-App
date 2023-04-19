class BusesController < ApplicationController
  authorize_resource
  before_action :authenticate_user!, only: [:edit, :update, :destroy]

  def index
    @route = Route.find(params[:route_id])
    @buses = @route.buses.paginate(page: params[:page])
  end

  def show
    @bus = Bus.find(params[:id])
  end

  def new
    @bus = Bus.new
  end

  def create
    @bus = Bus.new(bus_params)
    dates = params[:bus][:dates]
    if dates.present?
      @bus.dates = dates.reject(&:empty?).map(&:strip).join(", ")
    else
      @bus.dates = []
    end
    if @bus.save
      flash[:success] = "Bus Added successfully"
      redirect_to root_path
    else
      render "new"
    end
  end

  def edit
    @bus = Bus.find(params[:id])
  end

  def update
    @bus = Bus.find(params[:id])
    if @bus.update(bus_params)
      flash[:success] = "Bus updated"
      redirect_to root_path
    else
      render "edit"
    end
  end

  def destroy
    Bus.find(params[:id]).destroy
    flash[:success] = "Bus deleted"
    redirect_to request.referrer
  end

  def search
    @buses = Bus.all
    if params[:from].present?
      @buses = @buses.where(starting_city: params[:from])
    end
    if params[:to].present?
      @buses = @buses.where(destination_city: params[:to])
    end
    if params[:dates].present?
      @schedule = Schedule.where(dates: params[:dates])
    end
  end

  private

  def bus_params
    params.require(:bus).permit(:starting_city, :destination_city, :name, :number, :bustype, :price, :seats, :drop, :pickup, :departure_time, :arrival_time)
  end
end

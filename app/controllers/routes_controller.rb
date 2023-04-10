class RoutesController < ApplicationController
  def new
    @route = Route.new
  end

  def index
    @routes = Route.paginate(page: params[:page])
  end

  def create
    @route = Route.new(
      from: params[:route][:from],
      to: params[:route][:to],
      first_bus: params[:route][:first_bus],
      last_bus: params[:route][:last_bus],
      bus_id: params[:route][:bus_id],
    )
    if @route.save
      flash[:success] = "Route Added Successfully"
      redirect_to root_path
    else
      render "new"
    end
  end

  def show
    @route = Route.find(params[:id])
    @buses = @route.buses.paginate(page: params[:page])
  end

  def search
    @buses = Route.where("from ILIKE ? AND to ILIKE ? AND departure_time::date = ?",
                         "%#{params[:from]}%", "%#{params[:to]}%", params[:date].to_date)
  end

  private

  def route_params
    params.require(:route).permit(:from, :to, :first_bus, :last_bus, :bus_id)
  end
end


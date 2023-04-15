class RoutesController < ApplicationController
  load_and_authorize_resource

  def new
    @route = Route.new
  end

  def index
    @routes = Route.paginate(page: params[:page])
  end

  def create
    @route = Route.new(route_params)
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

  def edit
    @route = Route.find(params[:id])
  end

  def update
    @route = Route.find(params[:id])
    if @route.update(route_params)
      flash[:success] = "Route updated"
      redirect_to root_path
    else
      render "edit"
    end
  end

  def destroy
    Route.find(params[:id]).destroy
    flash[:success] = "Route deleted"
    redirect_to request.referrer
  end

  private

  def route_params
    params.require(:route).permit(:from, :to, :first_bus, :last_bus, :bus_id)
  end
end

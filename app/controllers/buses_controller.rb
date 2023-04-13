class BusesController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]

  def index
    @buses = Bus.paginate(page: params[:page])
  end

  def new
    @bus = Bus.new
  end

  def create
    @bus = Bus.new(bus_params)
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
    redirect_to root_path
  end

  private

  def bus_params
    params.require(:bus).permit(:name, :number, :bustype, :price, :seats, :route_id, :drop, :pickup, :departure_time, :arrival_time)
  end

  def logged_in_user
    unless user_signed_in?
      flash[:danger] = "Please sign up or sign in"
      redirect_to new_user_registration_path
    end
  end
end

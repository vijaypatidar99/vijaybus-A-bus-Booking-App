class BusesController < ApplicationController
  def new
    @bus = Bus.new
  end

  def create
    @bus = Bus.new(bus_params)
      if @bus.save
        flash[:success] = "Bus Added successfully"
        redirect_to root_path
      else
       render 'new'
      end
    end

  private

  def bus_params
    params.require(:bus).permit(:name, :number, :company, :price, :seats, :route_id)
  end
end

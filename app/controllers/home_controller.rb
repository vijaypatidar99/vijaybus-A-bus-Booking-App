class HomeController < ApplicationController
  def index
    @routes = Route.all
  end
  def home
  end
  
  def bus
    @buses = Bus.all
  end
end

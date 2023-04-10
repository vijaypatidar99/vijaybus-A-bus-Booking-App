class HomeController < ApplicationController
  def index
    @routes = Route.paginate(page: params[:page])
  end

end

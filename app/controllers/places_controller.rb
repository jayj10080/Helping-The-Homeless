class PlacesController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def home
  end

  def index
    @helper = Helper.all
    @helpee = Helpee.all
    
  end

  def resources
  end

end

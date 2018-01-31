class PlacesController < ApplicationController

  def home
  end

  def index
    @helper = Helper.all
    @helpee = Helpee.all
  end

  def resources
  end

end

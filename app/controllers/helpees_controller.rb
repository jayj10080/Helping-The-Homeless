class HelpeesController < ApplicationController
  def index
    @helpee = Helpee.all
  end

  def new
    @helpee = Helpee.new
  end

  def show
    @helpee = Helpee.find(params[:id])
  end

  def create
    Helpee.create(helpee_params)
    redirect_to root_path
  end

  private

  def helpee_params
    params.require(:helpee).permit(:name, :about, :story, :need)
  end
end

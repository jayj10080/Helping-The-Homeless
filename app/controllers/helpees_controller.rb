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

  def edit
    @helpee = Helpee.find(params[:id])
  end

  def update
    @helpee = Helpee.find(params[:id])
    @helpee.update_attributes(helpee_params)
    redirect_to helpee_path(@helpee)
  end

  def create
  @helpee = current_user.helpees.create(helpee_params)
  redirect_to root_path
  end

  private

  def helpee_params
    params.require(:helpee).permit(:name, :about, :story, :need, :address)
  end
end

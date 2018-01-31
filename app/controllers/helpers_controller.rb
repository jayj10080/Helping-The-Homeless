class HelpersController < ApplicationController
  def index
    @helper = Helper.all
  end

  def new
    @helper = Helper.new
  end

  def show
     @helper = Helper.find(params[:id])
  end

  def create
    Helper.create(helper_params)
    redirect_to root_path
  end

  private

  def helper_params
    params.require(:helper).permit(:name, :about, :how)
  end
end

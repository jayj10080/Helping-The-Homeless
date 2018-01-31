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

  def edit
    @helper = Helper.find(params[:id])
  end

  def update
    @helper = Helper.find(params[:id])
    @helper.update_attributes(helper_params)
    redirect_to helper_path(@helper)
  end

  def create
    @helper = current_user.helpers.create(helper_params)
    redirect_to root_path
  end

  private

  def helper_params
    params.require(:helper).permit(:name, :about, :how)
  end
end

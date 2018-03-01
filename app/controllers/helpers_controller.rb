class HelpersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @helper = Helper.all
  end

  def new
    if current_user.helper.present?
      return render plain: 'You already have a helper profile', status: :forbidden
    end

    if current_user.helpee.present?
      return render plain: 'You already have a helpee profile', status: :forbidden
    end
    @helper = Helper.new
  end

  def show
     @helper = Helper.find(params[:id])
  end

  def edit
    @helper = Helper.find(params[:id])

    if @helper.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end
  end

  def update
    @helper = Helper.find(params[:id])
    if @helper.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end
    @helper.update_attributes(helper_params)
    if @helper.valid?
      redirect_to helper_path(@helper)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @helper = Helper.find(params[:id])
    if @helper.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end
    @helper.destroy
    redirect_to root_path
  end

  def create
    @user = current_user
    @helper = Helper.new(helper_params)
    @helper.user = @user
    @helper.save

    if @helper.valid?
      redirect_to places_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def helper_params
    params.require(:helper).permit(:name, :about, :how, :avatar, :notifications)
  end
end

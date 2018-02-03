class HelpeesController < ApplicationController
  before_action :authenticate_user!

  def index
    @helpee = Helpee.all
  end

  def new
    if current_user.helper.present?
      return render plain: 'You already have a helper profile', status: :forbidden
    end

    if current_user.helpee.present?
      return render plain: 'You already have a helpee profile', status: :forbidden
    end
    @helpee = Helpee.new
  end

  def show
    @helpee = Helpee.find(params[:id])
  end

  def edit
    @helpee = Helpee.find(params[:id])

    if @helpee.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end
  end

  def update
    @helpee = Helpee.find(params[:id])
    if @helpee.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end
    @helpee.update_attributes(helpee_params)
    if @helpee.valid?
      redirect_to helpee_path(@helpee)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @helpee = Helpee.find(params[:id])
    if @helpee.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end
    @helpee.destroy
    redirect_to root_path
  end

  def create
    @user = current_user
    @helpee = Helpee.new(helpee_params)
    @helpee.user = @user
    @helpee.save

    if @helpee.valid?
      redirect_to places_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def helpee_params
    params.require(:helpee).permit(:name, :about, :story, :need, :address)
  end
end

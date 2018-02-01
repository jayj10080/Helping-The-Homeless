class HelpeesController < ApplicationController
  before_action :authenticate_user!

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
    redirect_to helpee_path(@helpee)
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
    @helpee = current_user.helpees.create(helpee_params)
    redirect_to root_path
  end

  private

  def helpee_params
    params.require(:helpee).permit(:name, :about, :story, :need, :address)
  end
end

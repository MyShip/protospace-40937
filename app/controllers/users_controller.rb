class UsersController < ApplicationController
  def index
    @user = User.all
  end
  
  def create
    @user = User.create(user_params)
    redirect_to action: :index
  end
  
  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name,:encrypted_password,:profile,:occupation,:position)
  end
end

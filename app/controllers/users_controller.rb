class UsersController < ApplicationController
  before_action :set_params, only: %i[show destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end

  def show
    @favorite_pictures = current_user.favorite_pictures
  end

  private

  def user_params
    params.require(:user).permit(:name,
                                 :email,
                                 :password,
                                 :password_confirmation)
  end

  def set_params
    @user = User.find(params[:id])
  end
end

class UsersController < ApplicationController
  before_action :authenticate_user!, except: :show

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    unless current_user == @user
      redirect_to user_path
    end
  end

  def update
    @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to user_path(@user)
      else
        render :edit
      end
  end

  private

  def user_params
    params.require(:user).permit(:email, :nickname, :profile)
  end

end

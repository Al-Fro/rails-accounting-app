class UsersController < ApplicationController
  def index
    @users = User.not_admins
  end

  def new
    @user = User.new
  end

  def create
    user = User.new permitted_params
    user.save!
  end

  def edit
    @user = User.find(params[:id])

    UserPolicy.authorize!(current_user, @user, :edit)
  end

  def update
    @user = User.find(params[:id])

    UserPolicy.authorize!(current_user, @user, :update)

    @user.update!(permitted_params)
  end

  private

  def permitted_params
    params.require(:user).permit(:email, :password, :first_name)
  end
end

class ResetPasswordsController < ApplicationController
  def edit
    @user = User.find(params[:id])

    UserPolicy.authorize!(current_user, @user, :reset_password)

    UserPolicy.new(current_user, @user, :reset_password).authorize!
  end

  def update
    @user = User.find(params[:id])

    UserPolicy.authorize!(current_user, @user, :reset_password)

    @user.update!(permitted_params)
  end

  private

  def permitted_params
    params.require(:user).permit(:password)
  end
end

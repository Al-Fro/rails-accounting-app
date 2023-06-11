class ApplicationController < ActionController::Base
  before_action :logged_in?

  rescue_from ApplicationPolicy::ActionForbiddenError, with: :render_403

  def logged_in?
    return if current_user

    flash[:danger] = ['Unathorize user']
    redirect_to root_path
  end

  def current_user = User.find_by(id: session[:current_user_id])

  def current_actor = current_user.actor

  def render_403 = render 'errors/403'
end

class UserPolicy < ApplicationPolicy
  def reset_password? = @current_user.role.admin?

  def edit? = @current_user.role.admin? || same_user?

  def update? = edit?

  private

  def same_user?
    @current_user.id == @resource.id
  end
end

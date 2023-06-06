class CompensationRequestPolicy < ApplicationPolicy
  def index?
    return true if admin?
    return true if employee? && same_user?
  
    false
  end

  def update? 
    return true if admin?
    return true if employee? && same_user?
    
    false
  end

  def edit? = update?
end

class ApplicationPolicy
  class ActionForbiddenError < StandardError; end

  def initialize(current_user, resource)
    @current_user = current_user
    @resource = resource
  end

  def result(action)
    raise ActionForbiddenError unless send("#{action}?")
  end

  def same_user?
    if enumerable_resource?
      @resource.all? { |r| @current_user.id == r.actor.user_id }
    else
      @current_user.id == @resource.actor.user_id
    end
  end

  def enumerable_resource?
    @resource.respond_to? :all?
  end

  def admin?
    @current_user.admin?
  end

  def employee?
    @current_user.employee?
  end

  class << self
    def authorize!(current_user, resource, action)
      new(current_user, resource).result(action)
    end
  end
end

class User < ApplicationRecord
  belongs_to :actor, polymorphic: true

  scope :not_admins, -> { where.not(actor_type: 'Admin') }

  def employee?
    actor_type == 'Employee'
  end

  def admin?
    actor_type == 'Admin'
  end
end

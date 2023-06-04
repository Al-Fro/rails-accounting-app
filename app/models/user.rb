class User < ApplicationRecord
  extend Enumerize

  enumerize :role, in: %i[simple_user admin], default: :simple_user

  has_many :compensation_requests, dependent: :destroy

  scope :not_admins, -> { where.not(role: 'admin') }
end

class Employee < ApplicationRecord
  has_one :user, as: :actor
  has_many :compensation_requests, as: :actor, dependent: :destroy
end

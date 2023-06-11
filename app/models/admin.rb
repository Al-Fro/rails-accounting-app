class Admin < ApplicationRecord
  has_one :user, as: :actor
end

# frozen_string_literal: true

FactoryBot.define do
  factory :compensation_request do
    status { :pending }
    amount { generate(:number) }
    currency { 'USD' }
  end
end

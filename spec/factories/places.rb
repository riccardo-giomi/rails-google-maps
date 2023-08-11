# frozen_string_literal: true

FactoryBot.define do
  factory :place do
    name { 'Place name' }
    latitude { '9.99' }
    longitude { '9.99' }
  end
end

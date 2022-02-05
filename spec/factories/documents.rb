# frozen_string_literal: true

FactoryBot.define do
  factory :document do
    title { Faker::Company.bs.titleize }
    description { Faker::Lorem.sentence }
  end
end

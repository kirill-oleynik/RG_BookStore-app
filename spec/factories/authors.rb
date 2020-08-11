# frozen_string_literal: true

FactoryBot.define do
  factory :author do
    name { Faker::Book.unique.author }
    bio { Faker::Lorem.sentence }
  end
end

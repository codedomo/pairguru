FactoryBot.define do
  factory :comment do
    content { Faker::Lorem.sentence(2, true) }
    user
    movie
  end
end

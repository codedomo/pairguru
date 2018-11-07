FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password "password"
    password_confirmation "password"
    confirmed_at Date.today
    comments_count 15

    trait :with_comments do
      after(:create) do |user|
        create_list :comment, 5, user: user
      end
    end

    trait :with_old_comments do
      after(:create) do |user|
        create_list :comment, 5, user: user, created_at: 10.days.ago
      end
    end

  end
end

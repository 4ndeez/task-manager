FactoryBot.define do
  factory :task do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    status { Random.rand(0..2) }
    association :user, factory: :user
    #user_id { user }
  end
end
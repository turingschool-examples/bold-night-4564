FactoryBot.define do
  factory :mechanic do
    name { Faker::Name.first_name }
    years_of_experience { Faker::Number.between(from: 1, to: 10) }
  end
end


FactoryBot.define do
  factory :user do
    first_name "Robert"
    last_name "Jacobs"
    email "factoryBot@yahoo.com"
    password "password"
    password_confirmation "password"
    id 1
  end
end

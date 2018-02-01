FactoryBot.define do
  factory :physician_review do
    rating 5
    review "This Doctor is AMAZING!"
    physician_id 1
    id 1
    user_id 1
  end
end

FactoryBot.define do
  factory :physician_review do
    rating 5
    review "This Doctor is AMAZING!"
    user_id 1
  end
end

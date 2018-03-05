FactoryBot.define do
  factory :physician do
    sequence(:first_name) {|n| "Matt #{n}" }
    sequence(:last_name) {|n| "Grossman #{n}" }
    review_date "November 10"
    sequence(:id) {|n| "1#{n + 1}" }
  end
end

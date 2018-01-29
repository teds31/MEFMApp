class PhysicianReview < ApplicationRecord
  belongs_to :user
  belongs_to :physician

  validates :rating, presence: true, :numericality => {:greater_than_or_equal_to => 1, :less_than => 7}
end

class PhysicianReview < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :physician

  validates :review, presence: true
  validates :rating, presence: true, :numericality => {:greater_than_or_equal_to => 1, :less_than => 7}

end

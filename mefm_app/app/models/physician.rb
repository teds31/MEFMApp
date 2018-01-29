class Physician < ApplicationRecord
  belongs_to :user, optional: true
  has_many :physician_reviews
  has_many :users, through: :physician_reviews

  validates :first_name, presence: true, allow_blank: false
  validates :last_name, presence: true, allow_blank: false

  def self.search(search)
    where('name ILIKE ?', "%#{search}%")
  end

end

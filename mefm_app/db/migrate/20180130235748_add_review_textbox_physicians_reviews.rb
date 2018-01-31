class AddReviewTextboxPhysiciansReviews < ActiveRecord::Migration[5.1]
  def change
       add_column :physician_reviews, :review, :text
  end
end

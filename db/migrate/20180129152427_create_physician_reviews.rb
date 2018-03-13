class CreatePhysicianReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :physician_reviews do |t|
      t.integer :rating, null: false
      t.integer :physician_id
      t.integer :user_id
      t.belongs_to :user
      t.belongs_to :physician

      t.timestamps
    end
  end
end

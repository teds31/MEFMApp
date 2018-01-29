class CreatePhysicians < ActiveRecord::Migration[5.1]
  def change
    create_table :physicians do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :review_date, null: false

      t.belongs_to :user
      t.timestamps
    end
  end
end

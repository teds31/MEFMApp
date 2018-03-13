class AddPostalCodeToPhysicians < ActiveRecord::Migration[5.1]
  def change
    add_column :physicians, :postal_code, :string
  end
end

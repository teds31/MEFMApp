class RemoveUseridFromPhysicans < ActiveRecord::Migration[5.1]
  def change
    remove_column(:physicians, :user_id)
  end
end

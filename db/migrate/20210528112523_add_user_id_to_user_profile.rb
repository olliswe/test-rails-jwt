class AddUserIdToUserProfile < ActiveRecord::Migration[6.1]
  def change
    add_column :user_profiles, :user_id, :integer, {null:false}
  end
end

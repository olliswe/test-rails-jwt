class AddPreferencesToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :preference, :json
  end
end

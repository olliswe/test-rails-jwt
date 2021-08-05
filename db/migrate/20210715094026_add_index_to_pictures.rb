class AddIndexToPictures < ActiveRecord::Migration[6.1]
  def change
    add_index :pictures, [:imageable_type, :imageable_id]
  end
end

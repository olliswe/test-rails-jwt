class AddSlugToUserProfiles < ActiveRecord::Migration[6.1]
  def change
    add_column :user_profiles, :slug, :string, default: 'random-slug', null: false
  end
end

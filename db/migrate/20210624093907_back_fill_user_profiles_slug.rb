class BackFillUserProfilesSlug < ActiveRecord::Migration[6.1]
  def up
    UserProfile.all.each do |user_profile|
      user_profile.slug = user_profile.id
      user_profile.save!
    end
  end

  def down
    UserProfile.all.each do |user_profile|
      user_profile.slug = 'random-slug'
      user_profile.save!
    end
  end
end

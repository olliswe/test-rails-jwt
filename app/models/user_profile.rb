class UserProfile < ApplicationRecord
  belongs_to :user
  validates :user, uniqueness: true

  before_validation :ensure_has_slug, on: [:create]


  def ensure_has_slug
    self.slug = user.id if slug=="random-slug"
  end
end

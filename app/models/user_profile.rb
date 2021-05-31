class UserProfile < ApplicationRecord
  belongs_to :user
  validates_uniqueness_of :user_id
  validates :age, presence: true
end

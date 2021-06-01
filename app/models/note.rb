class Note < ApplicationRecord
  belongs_to :user
  scope :modified, -> { where("created_at <> updated_at")}
end

class Note < ApplicationRecord
  belongs_to :user  # = we have a user id inside our model ( reverse assocation not nessecar)
  scope :modified, -> { where("created_at <> updated_at")}
end

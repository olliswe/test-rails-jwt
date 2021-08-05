class Note < ApplicationRecord
  belongs_to :user  # = we have a user id inside our model ( reverse assocation not nessecar)
  has_many :pictures, as: :imageable
  scope :modified, -> { where("created_at <> updated_at")}
  enum note_type: {message:'message' , memo: 'memo', diary_entry: 'diary_entry' }, _prefix:'type'
end

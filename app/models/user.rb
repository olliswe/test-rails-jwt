class User < ApplicationRecord
  has_secure_password
  has_many :notes, dependent: :destroy
  validates_associated :notes
  accepts_nested_attributes_for :notes, allow_destroy: true
  has_one :user_profile, dependent: :destroy
  has_many :pictures, as: :imageable
  accepts_nested_attributes_for :user_profile, allow_destroy: true

  store :preference, accessors: %i[dark_mode language font_size], coder: JSON

  validates :font_size, numericality: { only_integer: true, greater_than: 12, less_than: 18 }
  # def foo=(bar)
  #   @foo = bar
  # end

  # This is how you do an instance method:
  # def random_string
  #   if self.id == 1
  #     'First user!'
  #   else
  #     (0...8).map { (65 + rand(26)).chr }.join
  #   end
  # end

end

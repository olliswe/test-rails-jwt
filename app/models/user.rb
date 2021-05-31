class User < ApplicationRecord
  has_secure_password
  has_one :user_profile

  # This is how you do an instance method:
  # def random_string
  #   if self.id == 1
  #     'First user!'
  #   else
  #     (0...8).map { (65 + rand(26)).chr }.join
  #   end
  # end

end

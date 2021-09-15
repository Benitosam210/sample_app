class User < ApplicationRecord
  validates :name,  presence:true, length: { maximum: 50}
  before_save { self.email = email.downcase}
  VALID_EMAIL_REGEX = /\A[\w+\-.\d]+@[a-z\-.]+\.[a-z]+\z/i
  validates :email, presence:true, length: { maximum: 255},
                   format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password,  length: { minimum: 6}
end

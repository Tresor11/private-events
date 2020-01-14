class User < ApplicationRecord
  validates :name, presence: true, length: {minimum:3, maximum:20}
  valid_email= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with:valid_email}, uniqueness: { case_sensitive: false }
  has_secure_password
end

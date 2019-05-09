class User < ApplicationRecord
  has_secure_password
  has_many :user_events
  has_many :stories
  has_many :comments
  validates :email, presence: true, uniqueness: true
end

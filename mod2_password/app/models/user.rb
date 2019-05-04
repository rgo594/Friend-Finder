class User < ApplicationRecord
  has_secure_password
  has_many :user_events
  validates :email, presence: true, uniqueness: true
end

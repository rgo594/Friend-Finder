class User < ApplicationRecord
  has_secure_password
  has_many :user_events
  has_many :messages, through: :comments
  validates :email, presence: true, uniqueness: true
end

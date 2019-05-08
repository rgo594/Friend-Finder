class User < ApplicationRecord
  has_secure_password
  has_many :user_events
  has_many :events, through: :user_events
  validates :email, presence: true, uniqueness: true


  def full_name
    self.first_name + " " + self.last_name
  end
end

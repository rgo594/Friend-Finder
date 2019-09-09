class Event < ApplicationRecord
  has_many :user_events
  has_many :followers
  has_many :users, through: :user_events
end

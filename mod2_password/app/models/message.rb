class Message < ApplicationRecord
  has_many :users, through: :comments
end

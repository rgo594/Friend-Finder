class AddFollowerIdToUserEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :user_events, :follower_id, :integer
  end
end

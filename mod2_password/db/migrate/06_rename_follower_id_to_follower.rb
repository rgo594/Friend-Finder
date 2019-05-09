class RenameFollowerIdToFollower < ActiveRecord::Migration[5.2]
  def change
    rename_column :user_events, :follower_id , :follower
  end
end

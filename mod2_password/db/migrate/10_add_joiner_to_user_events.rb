class AddJoinerToUserEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :user_events, :joiner, :integer
  end
end

class AddEventIdToUserEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :user_events, :event_id, :integer
  end
end

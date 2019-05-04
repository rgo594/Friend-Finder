class CreateUserEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :user_events do |t|
      t.string :title
      t.string :description
      t.string :location
      t.datetime :date
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end

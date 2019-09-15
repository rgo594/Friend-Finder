class CreateFollowers < ActiveRecord::Migration[5.2]
  def change
    create_table :followers do |t|
      t.string :first_name
      t.string :last_name
      t.string :user_id
      t.belongs_to :event, foreign_key: true

      t.timestamps
    end
  end
end

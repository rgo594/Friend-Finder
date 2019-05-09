class CreateStories < ActiveRecord::Migration[5.2]
  def change
    create_table :stories do |t|
      t.string :title
      t.text :content
      t.integer :user_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

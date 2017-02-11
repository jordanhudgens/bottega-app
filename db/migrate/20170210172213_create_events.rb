class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :start_time
      t.datetime :end_time
      t.integer :user_id
      t.text :description
      t.integer :room_id
      t.timestamps
    end
  end
end

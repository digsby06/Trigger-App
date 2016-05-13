class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.date :date
      t.integer :button_id
      t.integer :count, default: 0
      t.timestamps null: false
    end
  end
end

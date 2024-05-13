class CreateAccesses < ActiveRecord::Migration[7.0]
  def change
    create_table :accesses do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.integer :room_number, null: false
      t.text :content, null: false

      t.timestamps
    end
  end
end

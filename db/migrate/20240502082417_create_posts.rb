class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.date :date,    null: false
      t.string :title, null: false
      t.text :text
      t.timestamps
    end
  end
end

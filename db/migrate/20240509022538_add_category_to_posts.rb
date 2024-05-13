class AddCategoryToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :category, :string, default: '回覧板'
  end
end


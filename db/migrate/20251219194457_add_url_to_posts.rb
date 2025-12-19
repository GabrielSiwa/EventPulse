class AddUrlToPosts < ActiveRecord::Migration[8.1]
  def change
    add_column :posts, :url, :string
  end
end

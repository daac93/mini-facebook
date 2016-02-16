class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :content
      t.integer :likes, default: 0

      t.timestamps null: false
    end
  end
end

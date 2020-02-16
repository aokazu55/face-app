class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :image
      t.string :content
      t.references :user, foreign_key: true

      t.timestamps
      t.index ["user_id"], name: "index_posts_on_user_id"
    end
  end
end

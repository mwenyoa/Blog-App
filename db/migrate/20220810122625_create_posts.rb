# rubocop: nodoc
class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.integer :authorid
      t.string :title
      t.text :text
      t.string :comments_counter
      t.string :likes_counter
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

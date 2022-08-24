class RemoveRefLikes < ActiveRecord::Migration[7.0]
  def change
    remove_column :likes, :postid
    remove_column :likes, :authorid
  end
end

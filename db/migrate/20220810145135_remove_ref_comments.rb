class RemoveRefComments < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :postid
    remove_column :comments, :authorid
  end
end

class AddPictureToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :picture, :string
  end

  def self.down
    remove_column :posts, :picture
  end
end

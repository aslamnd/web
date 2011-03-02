class AddDescriptionFieldToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :description, :string
  end

  def self.down
    remove_column :users, :description
  end
end

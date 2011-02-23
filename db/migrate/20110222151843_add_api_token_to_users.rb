class AddApiTokenToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :api_token, :string
    User.all.each do |user|
      user.assign_api_token
      user.save!
    end
  end

  def self.down
    remove_column :users, :api_token
  end
end

class AddRubygemToProject < ActiveRecord::Migration
  def self.up
    add_column :projects, :rubygem, :string
    change_column :projects, :downloads, :integer
  end

  def self.down
    remove_column :projects, :rubygem
    change_column :projects, :downloads, :string
  end
end

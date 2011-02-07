class AddRubygemToProject < ActiveRecord::Migration
  def self.up
    add_column :projects, :rubygem, :string
  end

  def self.down
    remove_column :projects, :rubygem
  end
end

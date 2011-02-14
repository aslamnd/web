class MarkdownizeProjectExtendedDescription < ActiveRecord::Migration
  def self.up
    add_column :projects, :rendered_extended_description, :text
    add_index :projects, :rendered_extended_description
  end

  def self.down
    remove_index :projects, :rendered_extended_description
    remove_column :projects, :rendered_extended_description
  end
end

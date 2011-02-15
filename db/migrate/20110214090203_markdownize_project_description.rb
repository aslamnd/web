class MarkdownizeProjectDescription < ActiveRecord::Migration
  def self.up
    add_column :projects, :rendered_description, :text
    add_index :projects, :rendered_description
  end

  def self.down
    remove_index :projects, :rendered_description
    remove_column :projects, :rendered_description
  end
end

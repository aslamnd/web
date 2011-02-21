class AddPublishedFlagToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :published, :boolean
  end

  def self.down
    remove_column :projects, :published
  end
end

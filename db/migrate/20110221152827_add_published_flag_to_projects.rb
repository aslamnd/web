class AddPublishedFlagToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :published, :boolean
    Project.all.each do |project|
      project.update_attribute(:published, true)
    end
  end

  def self.down
    remove_column :projects, :published
  end
end

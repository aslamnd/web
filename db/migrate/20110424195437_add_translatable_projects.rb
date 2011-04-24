class AddTranslatableProjects < ActiveRecord::Migration
  def self.up
    Project.create_translation_table!(
      {
        :description => :text, 
        :extended_description => :text,
        :quote => :string,
        :client_name => :string
      }, {
        :migrate_data => true
      })
  end

  def self.down
    Project.drop_translation_table!({:migrate_data => true})
  end
end

class CreateScreenshots < ActiveRecord::Migration
  def self.up
    create_table :screenshots do |t|
      t.string :file
      t.references :project

      t.timestamps
    end

    add_index :screenshots, :project_id
  end

  def self.down
    drop_table :screenshots
  end
end

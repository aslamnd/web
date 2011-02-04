class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :title
      t.string :quote
      t.string :client_name
      t.string :category

      t.string :cached_slug

      t.boolean :promoted
      t.text :description
      t.text :extended_description
      t.string :url
      t.integer :downloads

      t.timestamps
    end

    add_index :projects, :title
    add_index :projects, :category
    add_index :projects, :promoted
    add_index :projects, :created_at
    add_index :projects, :updated_at
    add_index :projects, :cached_slug
  end

  def self.down
    drop_table :projects
  end
end

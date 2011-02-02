class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.text :rendered_body

      t.integer :author_id

      t.timestamps
    end

    add_index :posts, :title
    add_index :posts, :author_id
  end

  def self.down
    drop_table :posts
  end
end

class Post < ActiveRecord::Base

  markdownize! :body

  belongs_to :author, :class_name => 'User'
  validates_associated :author

  delegate :year, to: :created_at
  delegate :month, to: :created_at

  delegate :name, to: :author, prefix: true

  has_friendly_id :title, use_slug: true

end

class Post < ActiveRecord::Base
  belongs_to :author, :class_name => 'User'

  delegate :year, to: :created_at
  delegate :month, to: :created_at

  delegate :name, to: :author, prefix: true

  has_friendly_id :title, use_slug: true
end

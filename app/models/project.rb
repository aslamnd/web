class Project < ActiveRecord::Base

  validates :title, :url, :description, :extended_description, :category, presence: true
  validates :category, inclusion: WorkCategory.names

  has_friendly_id :title, use_slug: true

end

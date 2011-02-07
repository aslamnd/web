class Project < ActiveRecord::Base

  validates :title, :url, :description, :extended_description, :category, presence: true
  validates :category, inclusion: WorkCategory.names

  has_many :screenshots

  accepts_nested_attributes_for :screenshots, allow_destroy: true, reject_if: :all_blank

  has_friendly_id :title, use_slug: true

  def screenshot
    screenshots.first
  end

end

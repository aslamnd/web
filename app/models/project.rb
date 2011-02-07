class Project < ActiveRecord::Base

  validates :title, :url, :description, :extended_description, :category, presence: true
  validates :category, inclusion: WorkCategory.names

  has_many :screenshots

  accepts_nested_attributes_for :screenshots, allow_destroy: true, reject_if: :all_blank

  has_friendly_id :title, use_slug: true

  scope :open_source, where(category: 'open-source')

  def screenshot
    screenshots.first
  end

  def update_downloads!
    update_attribute(:downloads,
                      RubygemsFetcher.get(:downloads,
                                          rubygem))
  end

end

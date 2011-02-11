class Project < ActiveRecord::Base

  after_create :update_downloads!, if: :open_source?

  validates :title, :url, :description, :extended_description, :category, presence: true
  validates :category, inclusion: WorkCategory.names

  has_many :screenshots

  accepts_nested_attributes_for :screenshots, allow_destroy: true, reject_if: :all_blank

  has_friendly_id :title, use_slug: true

  scope :open_source, where(category: 'open-source')
  scope :promoted, where(promoted: true)

  def self.update_downloads!
    open_source.each do |open_source_project|
      open_source_project.update_downloads!
    end
  end

  def screenshot
    screenshots.first
  end

  def open_source?
    category == 'open-source'
  end

  def update_downloads!
    update_attribute(:downloads,
                      RubygemsFetcher.get(:downloads,
                                          rubygem))
  end

  def normalize_friendly_id text
    rubygem.blank? ? super(text) : rubygem
  end

end

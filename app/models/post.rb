class Post < ActiveRecord::Base

  markdownize! :body, tab_width: 2, hierarchy: 1

  belongs_to :author, class_name: 'User'
  validates :author, :title, :body, presence: true

  delegate :year, to: :created_at
  delegate :month, to: :created_at

  delegate :name, to: :author, prefix: true

  has_friendly_id :title, use_slug: true

  mount_uploader :picture, PictureUploader

  scope :ordered, order: 'created_at desc'

  scope :from_archive, ->(year, month = nil) do
    year = year.to_i
    if month
      month = month.to_i
      where(arel_table[:created_at].gteq Date.new(year, month)).
        where(arel_table[:created_at].lt Date.new(year, month+1))
    else
      where(arel_table[:created_at].gteq Date.new(year)).
        where(arel_table[:created_at].lt Date.new(year+1))
    end
  end

end

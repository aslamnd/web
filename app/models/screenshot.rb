class Screenshot < ActiveRecord::Base
  mount_uploader :file, ScreenshotUploader
  belongs_to :project

  validates :file, presence: true

  # https://github.com/jnicklas/carrierwave/issues#issue/91
  def file=(value)
    unless value.is_a?(String)
      file_will_change!
      super
    end
  end

end

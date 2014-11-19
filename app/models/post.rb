class Post < ActiveRecord::Base
  IMAGE_THUMB_SIZE = '340x155'

  attr_accessor :remove_image

  is_impressionable
  has_attached_file :image, styles: { thumb: "#{IMAGE_THUMB_SIZE}>" }, default_url: "blog/:style/missing.png"

  before_validation { self.image.clear if remove_image? }

  validates :title, :description, :content, presence: true
  validates :title, uniqueness: true
  validates :title, length: { in: 3..150 }
  validates :description, length: { in: 3..200 }
  validates :content, length: { in: 3..60000 }
  validates :published, inclusion: { in: [true, false] }
  validates_attachment_content_type :image, content_type: ['image/jpg', 'image/jpeg', 'image/png']
  validates_attachment_size :image, :less_than => 1.megabyte

  scope :published, -> { where(published: true) }

  def unique_views
    impressionist_count(filter: :ip_address)
  end

  def remove_image?
    remove_image == '1'
  end
end

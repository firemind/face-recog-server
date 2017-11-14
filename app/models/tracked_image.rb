class TrackedImage < ApplicationRecord
  belongs_to :location
  has_many :trackings
  has_attached_file :image
  validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/]
  do_not_validate_attachment_file_type :image
  validates_attachment_content_type :image, not: true
end

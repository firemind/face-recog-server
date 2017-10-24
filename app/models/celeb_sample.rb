class CelebSample < ApplicationRecord
  belongs_to :celeb
  has_attached_file :image
  validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/]
  do_not_validate_attachment_file_type :image
  validates_attachment_content_type :image, not: true

end

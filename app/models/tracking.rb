class Tracking < ApplicationRecord
  belongs_to :location
  has_attached_file :image
  validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/]
  do_not_validate_attachment_file_type :image
  validates_attachment_content_type :image, not: true

  def coords(ratio=1.0)
    [left, top, left+width, top+height].map{|v| (v*ratio).to_i.to_s}.join(",")
  end
end

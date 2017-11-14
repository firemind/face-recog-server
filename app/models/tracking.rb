class Tracking < ApplicationRecord
  belongs_to :tracked_image
  has_one :location, through: :tracked_image
  delegate :image, to: :tracked_image

  def coords(ratio=1.0)
    [left, top, left+width, top+height].map{|v| (v*ratio).to_i.to_s}.join(",")
  end
end

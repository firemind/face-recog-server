class Location < ApplicationRecord
  has_many :tracked_images
  has_many :trackings, through: :tracked_images
  validates_presence_of :name
  validates_uniqueness_of :name

  def to_s
    name
  end
end

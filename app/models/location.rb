class Location < ApplicationRecord
  has_many :trackings
  validates_presence_of :name
  validates_uniqueness_of :name

  def to_s
    name
  end
end

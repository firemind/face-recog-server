class Celeb < ApplicationRecord
  has_many :samples, class_name: "CelebSample"

  def to_s
    name
  end
end

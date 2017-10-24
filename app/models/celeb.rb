class Celeb < ApplicationRecord
  has_many :samples, class_name: "CelebSample"
end

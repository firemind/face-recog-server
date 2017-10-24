class AddImageToTrackings < ActiveRecord::Migration[5.1]
  def change
    add_attachment :trackings, :image
  end
end

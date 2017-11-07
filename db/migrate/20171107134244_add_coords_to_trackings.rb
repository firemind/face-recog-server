class AddCoordsToTrackings < ActiveRecord::Migration[5.1]
  def change
    add_column :trackings, :width, :integer
    add_column :trackings, :height, :integer
    add_column :trackings, :left, :integer
    add_column :trackings, :top, :integer
  end
end

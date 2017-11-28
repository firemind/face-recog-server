class RemoveImageInfoFromTrackings < ActiveRecord::Migration[5.1]
  def change
    remove_column :trackings, :image_content_type
    remove_column :trackings, :image_file_name
    remove_column :trackings, :image_updated_at
    remove_column :trackings, :image_file_size
  end
end

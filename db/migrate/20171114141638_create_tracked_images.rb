class CreateTrackedImages < ActiveRecord::Migration[5.1]
  def change
    create_table :tracked_images do |t|
      t.integer :location_id

      t.datetime "created_at"
    end
    add_attachment :tracked_images, :image
    add_column :trackings, :tracked_image_id, :integer, null: false

    add_index :locations, :name, unique: true
    add_index :trackings, :created_at
    add_index :trackings, :tracked_image_id
    add_index :tracked_images, :location_id
    remove_column :trackings, :updated_at
    remove_column :trackings, :location_id


  end
end

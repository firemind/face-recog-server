class CreateTrackings < ActiveRecord::Migration[5.1]
  def change
    create_table :trackings do |t|
      t.integer :label
      t.integer :location_id

      t.timestamps
    end
  end
end

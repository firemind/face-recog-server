class CreateCelebSamples < ActiveRecord::Migration[5.1]
  def change
    create_table :celeb_samples do |t|
      t.integer :celeb_id, null: false

      t.timestamps
    end
    add_attachment :celeb_samples, :image
  end
end

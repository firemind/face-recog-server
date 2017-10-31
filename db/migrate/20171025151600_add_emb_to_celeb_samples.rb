class AddEmbToCelebSamples < ActiveRecord::Migration[5.1]
  def change
    add_column :celeb_samples, :emb, :binary
  end
end

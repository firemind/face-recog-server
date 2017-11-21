class AddEmbToTrackings < ActiveRecord::Migration[5.1]
  def change
    add_column :trackings, :emb, :binary
  end
end

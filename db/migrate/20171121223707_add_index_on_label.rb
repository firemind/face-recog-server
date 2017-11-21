class AddIndexOnLabel < ActiveRecord::Migration[5.1]
  def change
    add_index :trackings, :label
  end
end

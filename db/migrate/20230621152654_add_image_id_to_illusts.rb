class AddImageIdToIllusts < ActiveRecord::Migration[6.1]
  def change
    add_column :illusts, :image_id, :string
  end
end

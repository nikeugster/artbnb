class AddPriceToArts < ActiveRecord::Migration[6.0]
  def change
    add_column :arts, :price, :float
  end
end

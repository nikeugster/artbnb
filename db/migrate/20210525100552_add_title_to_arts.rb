class AddTitleToArts < ActiveRecord::Migration[6.0]
  def change
    add_column :arts, :title, :string
  end
end

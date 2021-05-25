class AddPictureToArts < ActiveRecord::Migration[6.0]
  def change
    add_column :arts, :picture, :string
  end
end

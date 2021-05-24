class CreateArts < ActiveRecord::Migration[6.0]
  def change
    create_table :arts do |t|
      t.string :artist
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

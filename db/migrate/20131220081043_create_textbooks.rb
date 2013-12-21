class CreateTextbooks < ActiveRecord::Migration
  def change
    create_table :textbooks do |t|
      t.string :title
      t.string :authors
      t.string :edition
      t.float :price
      t.string :isbn
      t.text :description
      t.string :image_url
      t.date :published

      t.timestamps
    end
  end
end

class CreateTextbooks < ActiveRecord::Migration
  def change
    create_table :textbooks do |t|
      t.string :title
      t.string :authors
      t.string :edition
      t.float :price
      t.date :date
      t.string :isbn

      t.belongs_to :courses

      t.timestamps
    end
  end
end

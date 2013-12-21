class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.string :letters
      t.integer :number

      t.timestamps
    end
  end
end

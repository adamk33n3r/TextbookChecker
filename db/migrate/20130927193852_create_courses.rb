class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.string :call_letters
      t.integer :number

      t.belongs_to :professors

      t.timestamps
    end
  end
end

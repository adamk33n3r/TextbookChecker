class CreateCourseTextbooks < ActiveRecord::Migration
  def change
    create_table :course_textbooks do |t|
      t.references :course, index: true
      t.references :textbook, index: true

      t.timestamps
    end
  end
end

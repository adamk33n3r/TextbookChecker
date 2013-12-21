class CreateProfessorCourses < ActiveRecord::Migration
  def change
    create_table :professor_courses do |t|
      t.references :professor, index: true
      t.references :course, index: true

      t.timestamps
    end
  end
end

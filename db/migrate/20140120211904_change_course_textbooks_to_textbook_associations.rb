class ChangeCourseTextbooksToTextbookAssociations < ActiveRecord::Migration
  def up
    drop_table :professor_courses
  end
  
  def change
    rename_table :course_textbooks, :textbook_associations
    change_table :textbook_associations do |t|
      t.references :professor, index: true
      t.remove :id
    end
  end
  
  def down
    create_table :professor_courses do |t|
      t.references :professor, index: true
      t.references :course, index: true

      t.timestamps
    end
  end
end

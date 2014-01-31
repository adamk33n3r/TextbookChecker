class ChangeCourseTextbookInRatingsToTextbookAssociation < ActiveRecord::Migration
  def up
    change_table :ratings do |t|
      t.remove :course_textbook_id
      t.references :textbook_association, index: true
    end
  end
  def down
    change_table :ratings do |t|
      t.references :course_textbook, index: true
      t.remove :textbook_association
    end
  end
end

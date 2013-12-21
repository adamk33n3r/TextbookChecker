class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.string :content
      t.references :vote, index: true
      t.references :student, index: true
      t.references :course_textbook, index: true

      t.timestamps
    end
  end
end

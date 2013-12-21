class CreateProfessors < ActiveRecord::Migration
  def change
    create_table :professors do |t|
      t.string :first_name
      t.string :last_name
      t.string :department
      t.string :title

      t.timestamps
    end
  end
end

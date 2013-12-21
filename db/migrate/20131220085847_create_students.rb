class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.date :year
      t.boolean :verified
      t.boolean :admin

      t.timestamps
    end
  end
end

class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.integer :year
      t.boolean :verified, default: false
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end

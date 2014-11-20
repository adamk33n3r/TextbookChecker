class AddStatusToProfessors < ActiveRecord::Migration
  def change
    add_column :professors, :status, :string
  end
end

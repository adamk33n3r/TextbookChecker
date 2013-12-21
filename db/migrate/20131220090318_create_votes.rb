class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :method
    end
  end
end

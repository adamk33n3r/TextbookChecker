class AddInfoToTextbooks < ActiveRecord::Migration
  def change
    add_column :textbooks, :description, :text
    add_column :textbooks, :image_url, :string
  end
end

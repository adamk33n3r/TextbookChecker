class AddEBookToTextbook < ActiveRecord::Migration
  def change
      add_column :textbooks, :is_ebook, :boolean, default: false
  end
end

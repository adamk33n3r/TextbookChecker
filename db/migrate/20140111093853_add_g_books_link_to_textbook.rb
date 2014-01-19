class AddGBooksLinkToTextbook < ActiveRecord::Migration
  def change
    add_column :textbooks, :g_link, :string
  end
end

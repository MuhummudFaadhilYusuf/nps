class AddTitleToPhotos < ActiveRecord::Migration[6.1]
  def change
   add_column :photos, :title, :string
  end
end

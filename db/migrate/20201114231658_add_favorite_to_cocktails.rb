class AddFavoriteToCocktails < ActiveRecord::Migration[6.0]
  def change
    add_column :cocktails, :favorite, :boolean
  end
end

class ChangeCoktailName < ActiveRecord::Migration[5.1]
  def change
    rename_table :coktails, :cocktails
  end
end

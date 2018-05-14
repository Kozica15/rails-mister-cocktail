class CreateCoktails < ActiveRecord::Migration[5.1]
  def change
    create_table :coktails do |t|
      t.string :name

      t.timestamps
    end
  end
end

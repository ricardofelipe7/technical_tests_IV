class CreateCsvs < ActiveRecord::Migration[7.0]
  def change
    create_table :csvs do |t|
      t.integer :show_id
      t.string :title
      t.string :country
      t.string :release_year
      t.string :description

      t.timestamps
    end
  end
end

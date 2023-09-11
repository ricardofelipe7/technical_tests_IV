class CreateCsvImports < ActiveRecord::Migration[7.0]
  def change
    create_table :csv_imports do |t|
      t.string 'show_id'
      t.timestamps
    end
  end
end

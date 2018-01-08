class CreateCompaniesDemands < ActiveRecord::Migration[5.1]
  def change
    create_table :companies_demands do |t|
      t.references :company, foreign_key: true
      t.text :note
      t.timestamps
    end
  end
end

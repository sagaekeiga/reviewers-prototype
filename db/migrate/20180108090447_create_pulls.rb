class CreatePulls < ActiveRecord::Migration[5.1]
  def change
    create_table :pulls do |t|
      t.references :pull, foreign_key: true
      t.string :url
      t.timestamps
    end
  end
end

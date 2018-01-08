class CreateCompaniesIdentities < ActiveRecord::Migration[5.1]
  def change
    create_table :companies_identities do |t|
      t.references :company, foreign_key: true
      t.string :provider
      t.string :uid
      t.string :token
      t.string :email
      t.string :name
      t.string :image
      t.datetime :deleted_at, index: true
      t.timestamps
    end
  end
end

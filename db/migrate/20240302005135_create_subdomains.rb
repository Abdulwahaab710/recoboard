class CreateSubdomains < ActiveRecord::Migration[7.1]
  def change
    create_table :subdomains do |t|
      t.string :name
      t.references :domain, null: false, foreign_key: true

      t.timestamps
    end
    add_index :subdomains, :name, unique: true
  end
end

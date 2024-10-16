class CreateDomains < ActiveRecord::Migration[7.1]
  def change
    create_table :domains do |t|
      t.string :name
      t.references :target, null: false, foreign_key: true

      t.timestamps
    end
    add_index :domains, :name, unique: true
  end
end

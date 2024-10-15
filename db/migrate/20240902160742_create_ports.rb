class CreatePorts < ActiveRecord::Migration[7.1]
  def change
    create_table :ports do |t|
      t.integer :number
      t.string :service_version
      t.references :subdomain, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true
      t.boolean :ssl
      t.boolean :open

      t.timestamps
    end
  end
end

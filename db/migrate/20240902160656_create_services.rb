class CreateServices < ActiveRecord::Migration[7.1]
  def change
    create_table :services do |t|
      t.string :name
      t.string :product

      t.timestamps
    end
  end
end

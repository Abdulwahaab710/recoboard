class CreateTargets < ActiveRecord::Migration[7.1]
  def change
    create_table :targets do |t|
      t.string :name
      t.string :program_url

      t.timestamps
    end
    add_index :targets, :name, unique: true
    add_index :targets, :program_url, unique: true
  end
end

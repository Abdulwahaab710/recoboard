# frozen_string_literal: true

class CreateSessions < ActiveRecord::Migration[7.0]
  def change
    create_table(:sessions) do |t|
      t.datetime(:last_active_at)
      t.string(:uuid)
      t.references(:user, null: false, foreign_key: true)

      t.timestamps
    end
    add_index(:sessions, :uuid, unique: true)
  end
end

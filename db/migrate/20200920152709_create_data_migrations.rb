# frozen_string_literal: true

class CreateDataMigrations < ActiveRecord::Migration[6.0]
  def change
    create_table(:data_migrations, primary_key: :version, id: :string, force: :cascade)
  end
end

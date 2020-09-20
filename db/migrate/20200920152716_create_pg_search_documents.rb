# frozen_string_literal: true

class CreatePgSearchDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :pg_search_documents, id: :uuid do |t|
      t.text(:content)
      t.belongs_to(:searchable, type: :uuid, polymorphic: true, index: true)
      t.timestamps(null: false)
    end
  end
end

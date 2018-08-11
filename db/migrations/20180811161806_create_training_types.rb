# frozen_string_literal: true

Hanami::Model.migration do
  change do
    create_table :training_types do
      primary_key :id

      column :name, String, null: false, unique: true, size: 32

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end

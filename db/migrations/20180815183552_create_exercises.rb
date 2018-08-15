# frozen_string_literal: true

Hanami::Model.migration do
  change do
    create_table :exercises do
      primary_key :id

      foreign_key :training_type_id, :training_types, on_delete: :cascade, null: false
      foreign_key :muscle_group_id, :muscle_groups, on_delete: :cascade, null: false

      column :name, String, null: false, unique: true, size: 64
      column :description, String, size: 8192

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end

# frozen_string_literal: true

Hanami::Model.migration do
  change do
    create_table :muscles do
      primary_key :id

      foreign_key :muscle_group_id, :muscle_groups, on_delete: :cascade, null: false

      column :name, String, null: false, unique: true, size: 64

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end

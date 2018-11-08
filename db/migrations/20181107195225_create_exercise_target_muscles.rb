# frozen_string_literal: true

Hanami::Model.migration do
  change do
    create_table :exercise_target_muscles do
      primary_key :id

      foreign_key :muscle_id, :muscles, on_delete: :cascade, null: false
      foreign_key :exercise_id, :exercises, on_delete: :cascade, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end

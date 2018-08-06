# frozen_string_literal: true

Hanami::Model.migration do
  change do
    create_table :workouts do
      primary_key :id

      column :workout_date, Date, null: false
      column :exercises, 'jsonb', null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end

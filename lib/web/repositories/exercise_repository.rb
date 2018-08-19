# frozen_string_literal: true

class ExerciseRepository < Hanami::Repository
  associations do
    belongs_to :training_type
    belongs_to :muscle_group
  end

  # rubocop:disable Metrics/MethodLength
  def all_with_training_types_and_muscle_groups
    sql = <<-SQL
      SELECT e.id, e.name,
             e.training_type_id, tt.name AS training_type_name,
             e.muscle_group_id, mg.name AS muscle_group_name
      FROM exercises e
      INNER JOIN training_types tt ON (e.training_type_id = tt.id)
      INNER JOIN muscle_groups mg ON (e.muscle_group_id = mg.id)
      GROUP BY e.training_type_id, e.name, tt.name, mg.name, e.id
      ORDER BY training_type_id, muscle_group_name, name
    SQL
    exercises.read(sql)
  end
  # rubocop:enable Metrics/MethodLength

  def find_with_training_type(id)
    aggregate(:training_type).where(id: id).map_to(Exercise).one
  end

  def find_with_muscle_group(id)
    aggregate(:muscle_group).where(id: id).map_to(Exercise).one
  end
end

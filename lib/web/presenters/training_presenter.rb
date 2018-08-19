# frozen_string_literal: true

class TrainingPresenter
  include Hanami::Presenter

  def call
    training_types.flat_map do |training_type|
      format_training_type(training_type)
    end
  end

  private

  def training_types
    @object.map do |exercise|
      training_type = training_type_by_exercise(exercise.id)

      {
        id: training_type.id,
        name: training_type.name
      }
    end.uniq
  end

  def training_type_by_exercise(id)
    repo.find_with_training_type(id).training_type
  end

  def format_training_type(training_type)
    muscle_groups = exercise_muscle_groups_by_training_type(training_type[:id])
    muscle_groups = inject_exercises_to_muscle_groups(muscle_groups, training_type[:id])

    {
      id: training_type[:id],
      name: training_type[:name],
      muscle_groups: muscle_groups
    }
  end

  def exercise_muscle_groups_by_training_type(id)
    @object.select { |item| item.training_type_id == id }.map do |item|
      muscle_group = exercise_with_muscle_group(item.id).muscle_group
      format_muscle_group(muscle_group)
    end.uniq
  end

  def exercise_with_muscle_group(id)
    repo.find_with_muscle_group(id)
  end

  def exercises_by_training_type_and_muscle_group(training_type_id, muscle_group_id)
    @object.select do |item|
      item.training_type_id == training_type_id && item.muscle_group_id == muscle_group_id
    end
  end

  def inject_exercises_to_muscle_groups(muscle_groups, training_type_id)
    muscle_groups.inject({}) do |_, muscle_group|
      exercises = exercises_by_training_type_and_muscle_group(training_type_id, muscle_group[:id]).map do |exercise|
        format_exercise(exercise)
      end

      muscle_group[:exercises] = exercises
    end

    muscle_groups
  end

  def format_muscle_group(muscle_group)
    {
      id: muscle_group.id,
      name: muscle_group.name
    }
  end

  def format_exercise(exercise)
    {
      id: exercise.id,
      name: exercise.name
    }
  end

  def repo
    @repo ||= ExerciseRepository.new
  end
end

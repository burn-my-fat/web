# frozen_string_literal: true

class TrainingPresenter
  include Hanami::Presenter

  def render
    @object.map do |training_type|
      muscle_group_ids = training_type.exercises.map(&:muscle_group_id).uniq

      muscle_groups = MuscleGroupRepository.new.find_by_ids(muscle_group_ids).map do |muscle_group|
        exercises = find_exercises_by_muscle_group_id(training_type.exercises, muscle_group.id)

        {
          id: muscle_group.id,
          name: muscle_group.name,
          exercises: exercises
        }
      end

      {
        id: training_type.id,
        name: training_type.name,
        muscle_groups: muscle_groups
      }
    end
  end

  private

  def find_exercises_by_muscle_group_id(exercises, muscle_group_id)
    exercises.select { |e| e.muscle_group_id == muscle_group_id }.map do |exercise|
      {
        id: exercise.id,
        name: exercise.name
      }
    end
  end
end

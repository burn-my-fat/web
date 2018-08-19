# frozen_string_literal: true

class AllTrainings
  def call
    TrainingPresenter.new(repo.all_with_training_types_and_muscle_groups.to_a).call
  end

  private

  def repo
    @repo ||= ExerciseRepository.new
  end
end

# frozen_string_literal: true

class AllTrainings
  def call
    TrainingPresenter.new(repo.all_with_exercises.to_a).render
  end

  private

  def repo
    @repo ||= TrainingTypeRepository.new
  end
end

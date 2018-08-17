# frozen_string_literal: true

class TrainingTypeRepository < Hanami::Repository
  associations do
    has_many :exercises
  end

  # FIXME: It should be covered with tests
  def all_with_exercises
    aggregate(:exercises).map_to(TrainingType)
  end

  def find_with_exercises(id)
    aggregate(:exercises).where(id: id).map_to(TrainingType).one
  end
end

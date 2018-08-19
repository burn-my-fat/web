# frozen_string_literal: true

class TrainingTypeRepository < Hanami::Repository
  associations do
    has_many :exercises
  end

  def find_with_exercises(id)
    aggregate(:exercises).where(id: id).map_to(TrainingType).one
  end
end

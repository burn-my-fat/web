# frozen_string_literal: true

class ExerciseRepository < Hanami::Repository
  associations do
    belongs_to :training_type
    belongs_to :muscle_group
  end

  def find_with_training_type(id)
    aggregate(:training_type).where(id: id).map_to(Exercise).one
  end

  def find_with_muscle_group(id)
    aggregate(:muscle_group).where(id: id).map_to(Exercise).one
  end
end

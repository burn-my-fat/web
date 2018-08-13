# frozen_string_literal: true

class MuscleRepository < Hanami::Repository
  associations do
    belongs_to :muscle_group
  end

  def find_with_muscle_group(id)
    aggregate(:muscle_group).where(id: id).map_to(Muscle).one
  end
end

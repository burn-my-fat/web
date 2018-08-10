# frozen_string_literal: true

class MuscleGroupRepository < Hanami::Repository
  def sorted
    muscle_groups.order { name.asc }.to_a
  end
end

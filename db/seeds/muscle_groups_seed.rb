# frozen_string_literal: true

class MuscleGroupsSeed < Base
  MUSCLE_GROUPS = %w[
    Default
    Abdominals
    Arms
    Back
    Chest
    Shoulders
    Legs
  ].freeze

  def initialize
    super(MuscleGroupRepository.new)
  end

  def call
    super(MUSCLE_GROUPS)
  end
end

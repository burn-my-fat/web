# frozen_string_literal: true

class TrainingTypesSeed < Base
  TRAINING_TYPES = ['Strength Training', 'Cardio', 'Stretching', 'Yoga'].freeze

  def initialize
    super(TrainingTypeRepository.new)
  end

  def call
    super(TRAINING_TYPES)
  end
end

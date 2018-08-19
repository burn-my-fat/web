# frozen_string_literal: true

module Seeds
  module TrainingTypes
    class Seed < Base
      TRAINING_TYPES = ['Strength Training', 'Cardio', 'Stretching', 'Yoga'].freeze

      def initialize
        super(TrainingTypeRepository.new)
      end

      def call
        super(TRAINING_TYPES)
      end
    end
  end
end

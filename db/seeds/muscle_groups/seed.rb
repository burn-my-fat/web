# frozen_string_literal: true

module Seeds
  module MuscleGroups
    class Seed < Base
      MUSCLE_GROUPS = %w[Default Abdominals Arms Back Chest Shoulders Legs].freeze

      def initialize
        super(MuscleGroupRepository.new)
      end

      def call
        super(MUSCLE_GROUPS)
      end
    end
  end
end

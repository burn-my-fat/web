# frozen_string_literal: true

module Seeds
  module Exercises
    class Chest
      CHEST = [
        'Barbell Inclide Bench Press',
        'Bench Press',
        'Butterfly',
        'Cable Crossover',
        'Decline Dumbbell Bench Press',
        'Dumbbell Bench Press',
        'Dumbbell Incline Bench Press',
        'Dumbbell Pullover',
        'Incline Dumbbell Flyes',
        'Smith Machine Bench Press'
      ].freeze

      def params
        {
          training_type: :strength_training,
          muscle_group: :chest,
          items: CHEST
        }
      end
    end
  end
end

# frozen_string_literal: true

module Seeds
  module Exercises
    class Legs
      LEGS = [
        'Barbell Lunge',
        'Barbell Squat',
        'Butt Lift (Bridge)',
        'Leg Press',
        'One-Legged Cable Kickback',
        'Romanian Deadlift',
        'Seated Calf Raise',
        'Seated Leg Curl',
        'Standing Leg Curl',
        'Thigh Abductor',
        'Thigh Adductor'
      ].freeze

      def params
        {
          training_type: :strength_training,
          muscle_group: :legs,
          items: LEGS
        }
      end
    end
  end
end

# frozen_string_literal: true

module Seeds
  module Exercises
    class Arms
      ARMS = [
        # Biceps
        'Alternate Hammer Curl',
        'Biceps Curl Barbell',
        'Biceps Curl Dumbbell',
        'Biceps Curl with Deadlift',
        'Concentration Curl',
        'Overhead Curl',
        'Rope Hammer Curl',

        # Triceps
        'Barbell Incline Triceps Extension',
        'Bench Dips',
        'JM Press',
        'Lying Triceps Press',
        'One Arm Triceps Extension',
        'Seated Triceps Press',
        'Standing One Arm Triceps Extension',
        'Tricep Dumbbell Kickback',
        'Triceps Pushdown V-Bar'
      ].freeze

      def params
        {
          training_type: :strength_training,
          muscle_group: :arms,
          items: ARMS
        }
      end
    end
  end
end

# frozen_string_literal: true

module Seeds
  module Exercises
    module StrengthTraining
      class Shoulders
        SHOULDERS = [
          'Arnold Dumbbell Press',
          'Barbell Upright Row',
          'Bent Over Low-Pulley Side Lateral',
          'Bent Over Rear Delt Row With Head on Bench',
          'Cable Seated Rear Lateral Raise',
          'Dumbbell Shoulder Press',
          'Front Cable Raise',
          'Machine Shoulder (Military) Press',
          'Seated Barbell Military Press',
          'Side Lateral Raise'
        ].freeze

        def params
          {
            training_type: :strength_training,
            muscle_group: :shoulders,
            items: SHOULDERS
          }
        end
      end
    end
  end
end

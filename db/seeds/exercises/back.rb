# frozen_string_literal: true

module Seeds
  module Exercises
    class Back
      BACK = [
        'Back Flyes With Resistance Bands',
        'Hyperextensions',
        'Lat Pulldown',
        'Rear Deltoid Pow',
        'Reverse Grip Bent-Over Rows',
        'Seated Cable Rows',
        'T-Bar Row',
        'V-Bar Pulldown'
      ].freeze

      def params
        {
          training_type: :strength_training,
          muscle_group: :back,
          items: BACK
        }
      end
    end
  end
end

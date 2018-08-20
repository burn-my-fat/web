# frozen_string_literal: true

module Seeds
  module Exercises
    module Cardio
      class Default < Base
        DEFAULT_CARDIO = [
          'Biking',
          'Elliptical',
          'Recumbent Biking',
          'Rowing',
          'Step Machine',
          'Treadmill'
        ].freeze

        def params
          {
            training_type: :cardio,
            muscle_group: :default,
            items: DEFAULT_CARDIO
          }
        end
      end
    end
  end
end

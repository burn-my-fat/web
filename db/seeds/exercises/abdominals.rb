# frozen_string_literal: true

module Exercises
  class Abdominals
    ABDOMINALS = [
      'Bent Knee Hip Raise',
      'Cross Body Crunch',
      'Crunches',
      'Decline Crunch',
      'Leg Raise',
      'Seated Ab Crunch',
      'Side Bend',
      'Side Plank'
    ].freeze

    def params
      {
        training_type: :strength_training,
        muscle_group: :abdominals,
        items: ABDOMINALS
      }
    end
  end
end

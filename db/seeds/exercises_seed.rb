# frozen_string_literal: true

require_relative 'exercises/base'
require_relative 'exercises/abdominals'
require_relative 'exercises/arms'
require_relative 'exercises/back'
require_relative 'exercises/chest'
require_relative 'exercises/legs'
require_relative 'exercises/shoulders'

module Exercises
  class ExercisesSeed < Base
    def initialize(training_types:, muscle_groups:)
      super(training_types: training_types, muscle_groups: muscle_groups)
    end

    # rubocop:disable Metrics/AbcSize
    def call
      params = []
      params << Abdominals.new.params
      params << Arms.new.params
      params << Back.new.params
      params << Chest.new.params
      params << Legs.new.params
      params << Shoulders.new.params

      super(params)
    end
    # rubocop:enable Metrics/AbcSize
  end
end

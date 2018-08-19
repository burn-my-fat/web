# frozen_string_literal: true

require_relative 'base'
require_relative 'abdominals'
require_relative 'arms'
require_relative 'back'
require_relative 'chest'
require_relative 'legs'
require_relative 'shoulders'

module Seeds
  module Exercises
    class Seed < Base
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
end

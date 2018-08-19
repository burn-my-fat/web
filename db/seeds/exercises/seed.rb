# frozen_string_literal: true

require_relative 'muscle_groups/base'
require_relative 'muscle_groups/abdominals'
require_relative 'muscle_groups/arms'
require_relative 'muscle_groups/back'
require_relative 'muscle_groups/chest'
require_relative 'muscle_groups/legs'
require_relative 'muscle_groups/shoulders'

module Seeds
  module Exercises
    class Seed
      attr_reader :training_types, :muscle_groups

      def initialize(training_types:, muscle_groups:)
        @training_types = training_types
        @muscle_groups  = muscle_groups

        repo.clear
      end

      def call
        params.each do |param|
          create_exercise(param)
        end
      end

      private

      def params
        [
          MuscleGroups::Abdominals.new.params,
          MuscleGroups::Arms.new.params,
          MuscleGroups::Back.new.params,
          MuscleGroups::Chest.new.params,
          MuscleGroups::Legs.new.params,
          MuscleGroups::Shoulders.new.params
        ]
      end

      def create_exercise(options)
        training_type, muscle_group, items = options.values_at(:training_type, :muscle_group, :items)

        items.each do |item|
          repo.create(
            training_type_id: training_type_id(training_type),
            muscle_group_id: muscle_group_id(muscle_group),
            name: item
          )
        end
      end

      def repo
        @repo ||= ExerciseRepository.new
      end

      def training_type_id(training_type)
        training_types[training_type].id
      end

      def muscle_group_id(muscle_group)
        muscle_groups[muscle_group].id
      end
    end
  end
end

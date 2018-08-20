# frozen_string_literal: true

require_relative 'strength_training/base'
require_relative 'strength_training/abdominals'
require_relative 'strength_training/arms'
require_relative 'strength_training/back'
require_relative 'strength_training/chest'
require_relative 'strength_training/legs'
require_relative 'strength_training/shoulders'
require_relative 'cardio/base'
require_relative 'cardio/default'

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
          StrengthTraining::Abdominals.new.params,
          StrengthTraining::Arms.new.params,
          StrengthTraining::Back.new.params,
          StrengthTraining::Chest.new.params,
          StrengthTraining::Legs.new.params,
          StrengthTraining::Shoulders.new.params,
          Cardio::Default.new.params
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

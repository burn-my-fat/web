# frozen_string_literal: true

module Seeds
  module Exercises
    class Base
      attr_reader :training_types, :muscle_groups

      def initialize(training_types:, muscle_groups:)
        @training_types = training_types
        @muscle_groups  = muscle_groups

        repo.clear
      end

      def call(params = [])
        params.each do |param|
          training_type, muscle_group, items = param.values_at(:training_type, :muscle_group, :items)

          items.each do |item|
            repo.create(
              training_type_id: training_type_id(training_type),
              muscle_group_id: muscle_group_id(muscle_group),
              name: item
            )
          end
        end
      end

      private

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

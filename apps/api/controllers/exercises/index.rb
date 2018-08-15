# frozen_string_literal: true

module Api::Controllers::Exercises
  class Index
    include Api::Action

    def call(*)
      exercises = ExerciseRepository.new.all
      self.body = JSON.dump(exercises.map(&:to_h))
    end
  end
end

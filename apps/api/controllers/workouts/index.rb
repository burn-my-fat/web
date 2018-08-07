# frozen_string_literal: true

module Api::Controllers::Workouts
  class Index
    include Api::Action

    def call(*)
      workouts = WorkoutRepository.new.all
      self.body = JSON.dump(workouts.map(&:to_h))
    end
  end
end

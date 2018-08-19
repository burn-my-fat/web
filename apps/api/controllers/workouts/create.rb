# frozen_string_literal: true

module Api::Controllers::Workouts
  class Create
    include Api::Action

    params do
      required(:workout).schema do
        required(:workout_date).filled(:date?)
        required(:exercises).filled(:array?)
      end
    end

    def call(params)
      self.format = :json

      if params.valid?
        workout = WorkoutRepository.new.create(params[:workout])
        self.status = 201
        self.body = JSON.generate(id: workout.id)
      else
        self.status = 422
      end
    end
  end
end

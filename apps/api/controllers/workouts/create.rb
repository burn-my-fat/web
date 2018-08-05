# frozen_string_literal: true

module Api::Controllers::Workouts
  class Create
    include Api::Action

    def call(*)
      self.body = 'OK'
    end
  end
end

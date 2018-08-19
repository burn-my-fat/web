# frozen_string_literal: true

module Api::Controllers::Trainings
  class Index
    include Api::Action

    def call(*)
      self.body = JSON.dump(AllTrainings.new.call)
      self.format = :json
    end
  end
end

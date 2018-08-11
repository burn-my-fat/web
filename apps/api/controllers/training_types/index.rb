# frozen_string_literal: true

module Api::Controllers::TrainingTypes
  class Index
    include Api::Action

    def call(*)
      training_types = TrainingTypeRepository.new.all
      self.body = JSON.dump(training_types.map(&:to_h))
    end
  end
end

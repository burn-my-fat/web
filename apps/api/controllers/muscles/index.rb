# frozen_string_literal: true

module Api::Controllers::Muscles
  class Index
    include Api::Action

    def call(*)
      muscles = MuscleRepository.new.all
      self.body = JSON.dump(muscles.map(&:to_h))
      self.format = :json
    end
  end
end

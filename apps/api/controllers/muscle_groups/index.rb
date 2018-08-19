# frozen_string_literal: true

module Api::Controllers::MuscleGroups
  class Index
    include Api::Action

    def call(*)
      musclegroups = MuscleGroupRepository.new.all
      self.body = JSON.dump(musclegroups.map(&:to_h))
      self.format = :json
    end
  end
end

# frozen_string_literal: true

require_relative '../config/boot'

#
# Muscle Groups
#
muscle_group_repository = MuscleGroupRepository.new
muscle_group_repository.clear

MUSCLE_GROUPS = %w[
  Abdominals
  Arms
  Back
  Chest
  Shoulders
  Legs
].freeze

MUSCLE_GROUPS.each do |muscle_group|
  muscle_group_repository.create(name: muscle_group)
end

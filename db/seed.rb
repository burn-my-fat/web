# frozen_string_literal: true

require_relative '../config/boot'

#
# Training Types
#

training_type_repository = TrainingTypeRepository.new
training_type_repository.clear

TRAINING_TYPES = ['Strength Training', 'Cardio', 'Stretching', 'Yoga'].freeze
TRAINING_TYPES.each do |training_type|
  training_type_repository.create(name: training_type)
end

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

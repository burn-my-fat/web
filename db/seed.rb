# frozen_string_literal: true

require_relative '../config/boot'
require_relative 'seeds/base'
require_relative 'seeds/training_types_seed'
require_relative 'seeds/muscle_groups_seed'
require_relative 'seeds/exercises_seed'

training_types = TrainingTypesSeed.new.call
muscle_groups = MuscleGroupsSeed.new.call

#
# Exercises
#
Exercises::ExercisesSeed.new(training_types: training_types, muscle_groups: muscle_groups).call

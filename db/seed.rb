# frozen_string_literal: true

require_relative '../config/boot'
require_relative 'seeds/base'
require_relative 'seeds/training_types/seed'
require_relative 'seeds/muscle_groups/seed'
require_relative 'seeds/exercises/seed'

training_types = Seeds::TrainingTypes::Seed.new.call
muscle_groups  = Seeds::MuscleGroups::Seed.new.call
Seeds::Exercises::Seed.new(training_types: training_types, muscle_groups: muscle_groups).call

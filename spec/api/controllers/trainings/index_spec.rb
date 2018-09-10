# frozen_string_literal: true

RSpec.describe Api::Controllers::Trainings::Index, type: :action do
  let(:action) { described_class.new }
  let(:training_type_repo) { TrainingTypeRepository.new }
  let(:muscle_group_repo) { MuscleGroupRepository.new }
  let(:exercise_repo) { ExerciseRepository.new }

  let(:params) { {} }

  it 'is successful' do
    response = action.call(params)
    expect(response).to have_http_status(:ok)
  end

  context 'when no data found' do
    it 'returns empty result' do
      response = action.call(params)
      expect(response).to include_json([])
    end
  end

  context 'when data is present' do
    it 'returns collection as JSON' do
      # Training types
      strength_training = Fabricate(:training_type, name: 'Strength Training')
      cardio            = Fabricate(:training_type, name: 'Cardio')

      # Muscle groups
      default_muscle_group = Fabricate(:muscle_group, name: 'Default')
      legs_muscle_group    = Fabricate(:muscle_group, name: 'Legs')
      chest_muscle_group   = Fabricate(:muscle_group, name: 'Chest')

      # Exercises
      barbell_squat = Fabricate(:exercise, name: 'Barbell Squat',
                                           training_type_id: strength_training.id,
                                           muscle_group_id: legs_muscle_group.id)

      leg_press = Fabricate(:exercise, name: 'Leg Press',
                                       training_type_id: strength_training.id,
                                       muscle_group_id: legs_muscle_group.id)

      dumbbell_bench_press = Fabricate(:exercise, name: 'Dumbbell Bench Press',
                                                  training_type_id: strength_training.id,
                                                  muscle_group_id: chest_muscle_group.id)

      biking = Fabricate(:exercise, name: 'Biking',
                                    training_type_id: cardio.id,
                                    muscle_group_id: default_muscle_group.id)

      response = action.call(params)

      expect(response).to include_json(
        [
          {
            id: strength_training.id,
            name: strength_training.name,
            muscle_groups: [
              {
                id: chest_muscle_group.id,
                name: chest_muscle_group.name,
                exercises: [
                  {
                    id: dumbbell_bench_press.id,
                    name: dumbbell_bench_press.name
                  }
                ]
              },
              {
                id: legs_muscle_group.id,
                name: legs_muscle_group.name,
                exercises: [
                  {
                    id: barbell_squat.id,
                    name: barbell_squat.name
                  },
                  {
                    id: leg_press.id,
                    name: leg_press.name
                  }
                ]
              }
            ]
          },
          {
            id: cardio.id,
            name: cardio.name,
            muscle_groups: [
              {
                id: default_muscle_group.id,
                name: default_muscle_group.name,
                exercises: [
                  {
                    id: biking.id,
                    name: biking.name
                  }
                ]
              }
            ]
          }
        ]
      )
    end
  end
end

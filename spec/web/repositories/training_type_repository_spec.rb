# frozen_string_literal: true

RSpec.describe TrainingTypeRepository, type: :repository do
  subject(:repo) { described_class.new }

  let(:training_type) { repo.create(name: 'Strength Training') }
  let(:muscle_group) { MuscleGroupRepository.new.create(name: 'Legs') }
  let(:exercises) { -> { repo.find_with_exercises(training_type.id).exercises } }

  describe '#find_with_exercises' do
    context 'when exercises do not exist' do
      it 'returns empty array' do
        expect(exercises.call).to be_empty
      end
    end

    context 'when exercises exist' do
      it 'returns exercises array' do
        exercise_repo = ExerciseRepository.new
        exercise_repo.create(name: 'Back Lunge', muscle_group_id: muscle_group.id, training_type_id: training_type.id)
        exercise_repo.create(name: 'Leg Press', muscle_group_id: muscle_group.id, training_type_id: training_type.id)

        expect(exercises.call.size).to eq(2)
      end
    end
  end
end

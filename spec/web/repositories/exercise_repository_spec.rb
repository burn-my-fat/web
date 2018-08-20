# frozen_string_literal: true

RSpec.describe ExerciseRepository, type: :repository do
  subject(:repo) { described_class.new }

  let(:training_type) { TrainingTypeRepository.new.create(name: 'Legs') }
  let(:muscle_group) { MuscleGroupRepository.new.create(name: 'Legs') }
  let(:exercise) do
    repo.create(name: 'Barbell Squat',
                training_type_id: training_type.id,
                muscle_group_id: muscle_group.id)
  end

  describe '#find_with_training_type' do
    it 'returns muscle group' do
      expect(repo.find_with_training_type(exercise.id).training_type).to eq(training_type)
    end
  end

  describe '#find_with_muscle_group' do
    it 'returns muscle group' do
      expect(repo.find_with_muscle_group(exercise.id).muscle_group).to eq(muscle_group)
    end
  end
end

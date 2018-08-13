# frozen_string_literal: true

RSpec.describe MuscleGroupRepository, type: :repository do
  let(:repository) { MuscleGroupRepository.new }
  let(:muscle_group) { repository.create(name: 'Legs') }

  describe '#sorted' do
    it 'returns sorted ascending by name' do
      items = %w[legs ноги arms руки chest грудь]
      items.each { |item| repository.create(name: item) }

      expect(repository.sorted.map(&:name)).to eq(items.sort)
    end
  end

  describe '#find_with_muscles' do
    context 'when muscles do not exist' do
      it 'returns empty array' do
        expect(repository.find_with_muscles(muscle_group.id).muscles).to be_empty
      end
    end

    context 'when muscles exist' do
      it 'returns muscles array' do
        muscle_repository = MuscleRepository.new
        muscle_repository.create(name: 'Quadriceps Femoris', muscle_group_id: muscle_group.id)
        muscle_repository.create(name: 'Adductor', muscle_group_id: muscle_group.id)

        expect(repository.find_with_muscles(muscle_group.id).muscles.size).to eq(2)
      end
    end
  end

  describe '#add_muscle' do
    it 'adds muscle to muscle group' do
      repository.add_muscle(muscle_group, name: 'Quadriceps Femoris')
      expect(repository.find_with_muscles(muscle_group.id).muscles.size).to eq(1)
    end
  end

  describe '#remove_muscle' do
    it 'removes muscle from muscle group' do
      muscle = repository.add_muscle(muscle_group, name: 'Quadriceps Femoris')
      expect(repository.find_with_muscles(muscle_group.id).muscles.size).to eq(1)

      repository.remove_muscle(muscle_group, muscle.id)
      expect(repository.find_with_muscles(muscle_group.id).muscles.size).to eq(0)
    end
  end
end

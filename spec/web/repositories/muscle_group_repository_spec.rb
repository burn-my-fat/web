# frozen_string_literal: true

RSpec.describe MuscleGroupRepository, type: :repository do
  let(:repo) { MuscleGroupRepository.new }
  let(:muscle_group) { repo.create(name: 'Legs') }
  let(:muscles) { -> { repo.find_with_muscles(muscle_group.id).muscles } }

  describe '#sorted' do
    it 'returns sorted ascending by name' do
      items = %w[legs ноги arms руки chest грудь]
      items.each { |item| repo.create(name: item) }

      expect(repo.sorted.map(&:name)).to eq(items.sort)
    end
  end

  describe '#find_with_muscles' do
    context 'when muscles do not exist' do
      it 'returns empty array' do
        expect(muscles.call).to be_empty
      end
    end

    context 'when muscles exist' do
      it 'returns muscles array' do
        muscle_repo = MuscleRepository.new
        muscle_repo.create(name: 'Quadriceps Femoris', muscle_group_id: muscle_group.id)
        muscle_repo.create(name: 'Adductor', muscle_group_id: muscle_group.id)

        expect(muscles.call.size).to eq(2)
      end
    end
  end

  describe '#add_muscle' do
    it 'adds muscle to muscle group' do
      repo.add_muscle(muscle_group, name: 'Quadriceps Femoris')
      expect(muscles.call.size).to eq(1)
    end
  end

  describe '#remove_muscle' do
    it 'removes muscle from muscle group' do
      muscle = repo.add_muscle(muscle_group, name: 'Quadriceps Femoris')
      expect(muscles.call.size).to eq(1)

      repo.remove_muscle(muscle_group, muscle.id)
      expect(muscles.call.size).to eq(0)
    end
  end
end

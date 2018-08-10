# frozen_string_literal: true

RSpec.describe MuscleGroupRepository, type: :repository do
  let(:repository) { MuscleGroupRepository.new }

  describe '#sorted' do
    it 'returns sorted ascending by name' do
      items = %w[legs ноги arms руки chest грудь]
      items.each { |item| repository.create(name: item) }

      expect(repository.sorted.map(&:name)).to eq(items.sort)
    end
  end
end

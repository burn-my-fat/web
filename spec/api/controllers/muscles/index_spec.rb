# frozen_string_literal: true

RSpec.describe Api::Controllers::Muscles::Index, type: :action do
  let(:action) { described_class.new }
  let(:repo) { MuscleRepository.new }
  let(:muscle_group) { MuscleGroupRepository.new.create(name: 'Legs') }
  let(:params) do
    {
      name: 'Quadriceps Femoris',
      muscle_group_id: muscle_group.id
    }
  end

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq 200
  end

  context 'when no muscles found' do
    it 'returns empty result' do
      response = action.call(params)

      result = JSON.parse(response[2].first)
      expect(result.size).to eq(0)
    end
  end

  context 'when muscles are present' do
    it 'returns ID equals to last created muscle' do
      repo.create(params)

      response = action.call(params)
      result = JSON.parse(response[2].first)

      expect(result.size).to eq(1)
      expect(result.first['id']).to eq(repo.last.id)
    end
  end
end

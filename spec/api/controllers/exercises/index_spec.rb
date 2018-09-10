# frozen_string_literal: true

RSpec.describe Api::Controllers::Exercises::Index, type: :action do
  let(:action) { described_class.new }
  let(:repo) { ExerciseRepository.new }
  let(:training_type) { Fabricate(:training_type, name: 'Strength Training') }
  let(:muscle_group) { Fabricate(:muscle_group, name: 'Legs') }
  let(:params) do
    {
      name: 'Barbell Squat',
      training_type_id: training_type.id,
      muscle_group_id: muscle_group.id
    }
  end

  it 'is successful' do
    response = action.call(params)
    expect(response).to have_http_status(:ok)
  end

  context 'when no exercises found' do
    it 'returns empty result' do
      response = action.call(params)

      result = JSON.parse(response[2].first)
      expect(result.size).to eq(0)
    end
  end

  context 'when exercises are present' do
    it 'returns ID equals to last created exercise' do
      repo.create(params)

      response = action.call(params)
      result = JSON.parse(response[2].first)

      expect(result.size).to eq(1)
      expect(result.first['id']).to eq(repo.last.id)
    end
  end
end

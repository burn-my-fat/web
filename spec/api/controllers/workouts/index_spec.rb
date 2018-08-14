# frozen_string_literal: true

RSpec.describe Api::Controllers::Workouts::Index, type: :action do
  let(:action) { described_class.new }
  let(:repo) { WorkoutRepository.new }
  let(:params) do
    {
      workout_date: '2018-08-06',
      exercises: [
        barbell_squat: {
          weight_units: :kg,
          meta: [
            {
              weight: 45.0,
              reps: 15
            }
          ]
        }
      ]
    }
  end

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq 200
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

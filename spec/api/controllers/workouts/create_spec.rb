# frozen_string_literal: true

RSpec.describe Api::Controllers::Workouts::Create, type: :action do
  let(:action) { described_class.new }
  let(:repo) { WorkoutRepository.new }

  describe 'with valid params' do
    let(:params) do
      Hash[workout: {
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
      }]
    end

    it 'creates a new workout' do
      action.call(params)
      expect(repo.last.id).not_to be_nil
    end

    it 'returns 201 status' do
      response = action.call(params)
      expect(response[0]).to eq(201)
    end

    it 'returns workout ID' do
      response = action.call(params)
      expect(JSON.parse(response[2].first, symbolize_names: true)[:id]).to eq(repo.last.id)
    end
  end

  describe 'with invalid params' do
    let(:params) { Hash[workout: {}] }

    it 'returns HTTP client error' do
      response = action.call(params)
      expect(response[0]).to eq(422)
    end

    it 'dumps errors in params' do
      action.call(params)
      errors = action.params.errors

      expect(errors.dig(:workout, :workout_date)).to include('is missing')
      expect(errors.dig(:workout, :exercises)).to include('is missing')
    end
  end
end

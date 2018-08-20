# frozen_string_literal: true

RSpec.describe Workout, type: :entity do
  subject(:workout) { described_class.new(params) }

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

  it 'can be initialized with attributes' do
    expect(workout.workout_date.to_s).to eq(params[:workout_date])
    expect(workout.exercises).to eq(params[:exercises])
  end
end

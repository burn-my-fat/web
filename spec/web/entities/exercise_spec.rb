# frozen_string_literal: true

RSpec.describe Exercise, type: :entity do
  let(:params) do
    {
      name: 'Barbell Squat'
    }
  end

  it 'can be initialized with attributes' do
    exercise = Exercise.new(params)
    expect(exercise.name).to eq(params[:name])
  end
end

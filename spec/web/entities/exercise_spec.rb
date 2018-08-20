# frozen_string_literal: true

RSpec.describe Exercise, type: :entity do
  subject(:exercise) { described_class.new(params) }

  let(:params) do
    {
      name: 'Barbell Squat'
    }
  end

  it 'can be initialized with attributes' do
    expect(exercise.name).to eq(params[:name])
  end
end

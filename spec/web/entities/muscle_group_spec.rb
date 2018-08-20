# frozen_string_literal: true

RSpec.describe MuscleGroup, type: :entity do
  subject(:musclegroup) { described_class.new(params) }

  let(:params) do
    {
      name: 'Legs'
    }
  end

  it 'can be initialized with attributes' do
    expect(musclegroup.name).to eq(params[:name])
  end
end

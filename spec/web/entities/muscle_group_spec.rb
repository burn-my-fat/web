# frozen_string_literal: true

RSpec.describe MuscleGroup, type: :entity do
  let(:params) do
    {
      name: 'Legs'
    }
  end

  it 'can be initialized with attributes' do
    musclegroup = MuscleGroup.new(params)
    expect(musclegroup.name).to eq(params[:name])
  end
end

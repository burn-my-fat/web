# frozen_string_literal: true

RSpec.describe Muscle, type: :entity do
  let(:params) do
    {
      name: 'Quadriceps Femoris'
    }
  end

  it 'can be initialized with attributes' do
    muscle = Muscle.new(params)
    expect(muscle.name).to eq(params[:name])
  end
end

# frozen_string_literal: true

RSpec.describe Muscle, type: :entity do
  subject(:muscle) { described_class.new(params) }

  let(:params) do
    {
      name: 'Quadriceps Femoris'
    }
  end

  it 'can be initialized with attributes' do
    expect(muscle.name).to eq(params[:name])
  end
end

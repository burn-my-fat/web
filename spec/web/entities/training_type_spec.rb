# frozen_string_literal: true

RSpec.describe TrainingType, type: :entity do
  subject(:training_type) { described_class.new(params) }

  let(:params) do
    {
      name: 'Strength Training'
    }
  end

  it 'can be initialized with attributes' do
    expect(training_type.name).to eq(params[:name])
  end
end

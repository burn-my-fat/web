# frozen_string_literal: true

RSpec.describe TrainingType, type: :entity do
  let(:params) do
    {
      name: 'Strength Training'
    }
  end

  it 'can be initialized with attributes' do
    training_type = TrainingType.new(params)
    expect(training_type.name).to eq(params[:name])
  end
end

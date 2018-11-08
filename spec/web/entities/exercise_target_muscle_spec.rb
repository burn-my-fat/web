# frozen_string_literal: true

RSpec.describe ExerciseTargetMuscle, type: :entity do
  subject(:exercise_target_muscle) { described_class.new(params) }

  let(:params) do
    {
      muscle_id: Fabricate(:muscle).id,
      exercise_id: Fabricate(:exercise).id
    }
  end

  it 'can be initialized with attributes' do
    expect(exercise_target_muscle.muscle_id).to eq(params[:muscle_id])
    expect(exercise_target_muscle.exercise_id).to eq(params[:exercise_id])
  end
end

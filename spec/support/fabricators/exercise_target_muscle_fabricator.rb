# frozen_string_literal: true

Fabricator(:exercise_target_muscle) do
  muscle_id { Fabricate(:muscle).id }
  exercise_id { Fabricate(:exercise).id }
end

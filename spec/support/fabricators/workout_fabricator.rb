Fabricator(:workout) do
    workout_date { FFaker::Time.datetime }
    exercises {[
        barbell_squat: {
          weight_units: :kg,
          meta: [
            {
              weight: 45.0,
              reps: 15
            }
          ]
        }
      ]}
end
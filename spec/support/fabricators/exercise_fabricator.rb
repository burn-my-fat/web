# frozen_string_literal: true

Fabricator(:exercise) do
  name { FFaker::Lorem.words(2) }
  description { FFaker::Lorem.paragraph }

  training_type { Fabricate(:training_type) }
  muscle_group { Fabricate(:muscle_group) }
end

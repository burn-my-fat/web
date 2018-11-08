# frozen_string_literal: true

Fabricator(:exercise) do
  name { FFaker::Lorem.words(2) }
  description { FFaker::Lorem.paragraph }

  training_type_id { Fabricate(:training_type).id }
  muscle_group_id { Fabricate(:muscle_group).id }
end

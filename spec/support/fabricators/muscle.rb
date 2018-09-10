# frozen_string_literal: true

Fabricator(:muscle) do
  name { FFaker::Lorem.words(2) }

  muscle_group { Fabricate(:muscle_group) }
end

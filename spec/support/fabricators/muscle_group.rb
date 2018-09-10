# frozen_string_literal: true

Fabricator(:muscle_group) do
  name { FFaker::Lorem.words(2) }
end

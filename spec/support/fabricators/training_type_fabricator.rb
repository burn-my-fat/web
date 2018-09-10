# frozen_string_literal: true

Fabricator(:training_type) do
  name { FFaker::Lorem.words(2) }
end

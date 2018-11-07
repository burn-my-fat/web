# frozen_string_literal: true

Fabricator(:training_type) do
  name { FFaker::Lorem.word }
end

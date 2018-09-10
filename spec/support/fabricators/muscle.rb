Fabricator(:muscle) do
  name { FFaker::Lorem.word }

  muscle_group { Fabricate(:muscle_group) }
end
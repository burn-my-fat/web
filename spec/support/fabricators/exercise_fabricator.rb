Fabricator(:exercise) do
    name { FFaker::Lorem.word }
    description { FFaker::Lorem.paragraph }

    training_type { Fabricate(:training_type) }
    muscle_group { Fabricate(:muscle_group) }
end
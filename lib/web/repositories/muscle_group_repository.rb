# frozen_string_literal: true

class MuscleGroupRepository < Hanami::Repository
  associations do
    has_many :muscles
    has_many :exercises
  end

  def sorted
    muscle_groups.order { name.asc }.to_a
  end

  def find_with_muscles(id)
    aggregate(:muscles).where(id: id).map_to(MuscleGroup).one
  end

  def add_muscle(muscle_group, data)
    assoc(:muscles, muscle_group).add(data)
  end

  def remove_muscle(muscle_group, id)
    assoc(:muscles, muscle_group).where(id: id).delete
  end

  def find_with_exercises(id)
    aggregate(:exercises).where(id: id).map_to(MuscleGroup).one
  end
end

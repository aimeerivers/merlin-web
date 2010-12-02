Before('@simple_map') do
  create_rooms
  create_pathways
end

def create_rooms
  Room.create!(key: 'start', description: "You wake up on a grassy bank at a cross-roads. It is warm and the bees are humming. There is a feeling of magic and mystery all around you.")
  Room.create!(key: 'grassy bank', description: "You are standing at a cross-roads. On a grassy bank a figure lies sleeping.")
  Room.create!(key: 'trees', description: "You are on a path running North to South. Thick trees are at the foot of a mountain to the North.")
  Room.create!(key: 'evergreen glade', description: "You are in an evergreen glade, with red spotted toadstools growing in a ring. A path runs from East to West.")
  Room.create!(key: 'deep river', description: "To the South a deep river is running swiftly. Paths lead North and East. A golden spire can be seen to the South across the water.")
  Room.create!(key: 'old stone wall', description: "To the West is an old stone wall four metres tall. A winding track runs to the East.")
  Room.create!(key: 'old wall', description: "An old wall is to the East. North is a path which winds into the mist. A small, dark tunnel goes West. To the South are some trees.")
end

def create_pathways
  Pathway.create!(from: 'start', direction: 'north', going_to: 'trees')
  Pathway.create!(from: 'start', direction: 'east', going_to: 'evergreen glade')
  Pathway.create!(from: 'start', direction: 'south', going_to: 'deep river')
  Pathway.create!(from: 'start', direction: 'west', going_to: 'old stone wall')

  Pathway.create!(from: 'grassy bank', direction: 'north', going_to: 'trees')
  Pathway.create!(from: 'grassy bank', direction: 'east', going_to: 'evergreen glade')
  Pathway.create!(from: 'grassy bank', direction: 'south', going_to: 'deep river')
  Pathway.create!(from: 'grassy bank', direction: 'west', going_to: 'old stone wall')

  Pathway.create!(from: 'trees', direction: 'south', going_to: 'grassy bank')
  Pathway.create!(from: 'evergreen glade', direction: 'west', going_to: 'grassy bank')
  Pathway.create!(from: 'deep river', direction: 'north', going_to: 'grassy bank')
  Pathway.create!(from: 'old stone wall', direction: 'east', going_to: 'grassy bank')

  ObstaclePathway.create!(from: 'old stone wall', direction: 'west', going_to: 'old wall', restriction: 'The wall is too high.', item: 'ladder', result: 'The ladder leans against the wall.')
end

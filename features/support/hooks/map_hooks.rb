Before('@simple_map') do
  create_rooms
  create_items
end

After('@simple_map') do
  [Room, Item].each do |model|
    model.destroy_all
  end
end

def create_rooms
  Room.create!( key: 'start',
    description: "You wake up on a grassy bank at a cross-roads. It is warm and the bees are humming. There is a feeling of magic and mystery all around you.",
    pathways: [
      Pathway.new(direction: 'north', going_to: 'trees'),
      Pathway.new(direction: 'east', going_to: 'evergreen glade'),
      Pathway.new(direction: 'south', going_to: 'deep river'),
      Pathway.new(direction: 'west', going_to: 'old stone wall')
    ]
  )

  Room.create!( key: 'grassy bank',
    description: "You are standing at a cross-roads. On a grassy bank a figure lies sleeping.",
    pathways: [
      Pathway.new(direction: 'north', going_to: 'trees'),
      Pathway.new(direction: 'east', going_to: 'evergreen glade'),
      Pathway.new(direction: 'south', going_to: 'deep river'),
      Pathway.new(direction: 'west', going_to: 'old stone wall')
    ]
  )

  Room.create!( key: 'trees',
    description: "You are on a path running North to South. Thick trees are at the foot of a mountain to the North.",
    pathways: [ Pathway.new(direction: 'south', going_to: 'grassy bank') ]
  )


  Room.create!( key: 'evergreen glade',
    description: "You are in an evergreen glade, with red spotted toadstools growing in a ring. A path runs from East to West.",
    pathways: [
      Pathway.new(direction: 'west', going_to: 'grassy bank'),
      Pathway.new(direction: 'east', going_to: 'clue: ring')
    ]
  )

  Room.create!(key: 'deep river',
    description: "To the South a deep river is running swiftly. Paths lead North and East. A golden spire can be seen to the South across the water.",
    pathways: [
      Pathway.new(direction: 'north', going_to: 'grassy bank'),
      ObstaclePathway.new(direction: 'south', going_to: 'river', restriction: 'You are swept away by the current.', item: 'plank', result: 'The plank reaches to the other side.', fatal_without_item: true)
    ]
  )

  Room.create!(key: 'old stone wall',
    description: "To the West is an old stone wall four metres tall. A winding track runs to the East.",
    pathways: [
      Pathway.new(direction: 'east', going_to: 'grassy bank'),
      ObstaclePathway.new(direction: 'west', going_to: 'old wall', restriction: 'The wall is too high.', item: 'ladder', result: 'The ladder leans against the wall.', after_effect: 'You have climbed over.')
    ]
  )

  Room.create!(key: 'old wall',
    description: "An old wall is to the East. North is a path which winds into the mist. A small, dark tunnel goes West. To the South are some trees."
  )

  Room.create!(key: 'clue: ring',
    description: "You are lost, but you find a clue: A ring helps to move a stone."
  )
end

def create_items
  Item.create!(name: 'mirror', initial_room: 'deep river', score: 3)
  Item.create!(name: 'ladder', initial_room: 'old stone wall', score: 3)
  Item.create!(name: 'cake', initial_room: 'trees', score: 3)

  Item.create!(name: 'rope', initial_room: 'deep river', score: 3)
  Item.create!(name: 'harp', initial_room: 'deep river', score: 3)
  Item.create!(name: 'mask', initial_room: 'deep river', score: 3)
  Item.create!(name: 'water', initial_room: 'deep river', score: 3)
  Item.create!(name: 'penny', initial_room: 'deep river', score: 3)
end

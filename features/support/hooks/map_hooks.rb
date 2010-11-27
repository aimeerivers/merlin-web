Before('@simple_map') do
  Room.create!(key: 'start', description: "You wake up on a grassy bank at a cross-roads. It is warm and the bees are humming. There is a feeling of magic and mystery all around you.")
  Room.create!(key: 'grassy bank', description: "You are standing at a cross-roads. On a grassy bank a figure lies sleeping.")
  Room.create!(key: 'trees', description: "You are on a path running North to South. Thick trees are at the foot of a mountain to the North.")
  Room.create!(key: 'evergreen glade', description: "You are in an evergreen glade, with red spotted toadstools growing in a ring. A path runs from East to West.")
  Room.create!(key: 'deep river', description: "To the South a deep river is running swiftly. Paths lead North and East. A golden spire can be seen to the South across the water.")
end

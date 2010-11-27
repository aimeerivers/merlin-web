require 'spec_helper'

describe Adventure do
  let(:adventure) { Adventure.new }

  context 'a new adventure' do
    it 'starts at the grassy bank' do
      adventure.description.should =~ /You wake up on a grassy bank/
    end
  end

  context 'moving around' do
    it 'changes the description' do
      adventure.move('north')
      adventure.description.should =~ /Thick trees are at the foot of a mountain/
    end

    it 'can go South too' do
      adventure.move('south')
      adventure.description.should =~ /To the South a deep river is running swiftly/
    end

    it 'does not move with invalid input' do
      current_room = adventure.current_room
      adventure.move('hackhackhack')
      adventure.current_room.should == current_room
    end

    it 'finds a path that links from the current room in that direction' do
      Pathway.should_receive(:from_room_in_direction).with('start', 'north')
      adventure.move('north')
    end

    context 'when it finds a path going to a different room' do
      it 'changes to that room' do
        current_room = adventure.current_room
        Pathway.stub(:from_room_in_direction).and_return(mock(:path, going_to: 'trees'))
        adventure.move('north')
        adventure.current_room.should_not == current_room
      end
    end

    context 'when it finds no path in that direction' do
      it 'does nothing' do
        current_room = adventure.current_room
        Pathway.stub(:from_room_in_direction).and_return(nil)
        adventure.move('north')
        adventure.current_room.should == current_room
      end
    end
  end

end

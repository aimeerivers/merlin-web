require 'spec_helper'

describe Adventure do
  let(:adventure) { Adventure.new }
  let(:start_room) { mock(:room, key: 'start') }
  let(:trees_room) { mock(:room) }

  before do
    Room.stub(:by_key).with('start') { start_room }
  end

  context 'a new adventure' do
    it 'starts at the grassy bank' do
      Room.should_receive(:by_key).with('start')
      Adventure.new.current_room.should == start_room
    end
  end

  context 'moving around' do
    it 'does not move with invalid input' do
      current_room = adventure.current_room
      adventure.move('hackhackhack').should be_false
      adventure.current_room.should == current_room
    end

    it 'does not change room if the room cannot be found' do
      current_room = adventure.current_room
      Pathway.stub(:from_room_in_direction) { (mock(:path, going_to: 'trees')) }
      Room.stub(:by_key).with('trees') { nil }
      adventure.move('south').should be_false
      adventure.current_room.should == current_room
    end

    it 'finds a path that links from the current room in that direction' do
      Pathway.should_receive(:from_room_in_direction).with('start', 'north')
      adventure.move('north')
    end

    context 'when it finds a path going to a different room' do
      it 'changes to that room' do
        Pathway.stub(:from_room_in_direction).and_return(mock(:path, going_to: 'trees'))
        Room.stub(:by_key).with('trees') { trees_room }
        adventure.move('north')
        adventure.current_room.should == trees_room
      end
    end

    context 'when it finds no path in that direction' do
      it 'does nothing' do
        current_room = adventure.current_room
        Pathway.stub(:from_room_in_direction).and_return(nil)
        adventure.move('north').should be_false
        adventure.current_room.should == current_room
      end
    end
  end

end

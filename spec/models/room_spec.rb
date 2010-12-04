require 'spec_helper'

describe Room do
  let(:room) { Room.new(key: 'old stone wall') }

  context 'available directions' do
    before do
      Pathway.stub(:from_room) { [] }
    end

    it 'looks for pathways going from the room' do
      Pathway.should_receive(:from_room).with(room.key)
      room.available_directions
    end

    it 'maps the directions of those pathways' do
      Pathway.stub(:from_room) {
        [mock(:pathway, direction: 'north'),
          mock(:pathway, direction: 'south')] }
      room.available_directions.should == ['north', 'south']
    end
  end

end

require 'spec_helper'

describe Pathway do

  context 'finding a pathway from a room in a direction' do
    it 'looks for a pathway' do
      Pathway.should_receive(:find_by_from_and_direction).with('start', 'north')
      Pathway.from_room_in_direction('start', 'north')
    end

    it 'returns nil if it finds no pathway' do
      Pathway.from_room_in_direction('hello', 'funny').should be_nil
    end
  end

  context 'traversing a pathway' do
    let(:pathway) { Pathway.new(going_to: 'old stone wall') }

    it 'provides the key of the room it goes to' do
      pathway.traverse.should == 'old stone wall'
    end
  end

end

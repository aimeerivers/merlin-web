require 'spec_helper'

describe Pathway do

  context 'finding a pathway from a room in a direction' do
    it 'looks for a pathway' do
      Pathway::PATHWAYS.should_receive(:[]).with('start.north')
      Pathway.from_room_in_direction('start', 'north')
    end

    it 'returns nil if it finds no pathway' do
      Pathway.from_room_in_direction('hello', 'funny').should be_nil
    end
  end

end

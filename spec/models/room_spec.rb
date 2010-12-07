require 'spec_helper'

describe Room do
  let(:pathway) { Pathway.new(direction: 'north') }
  let(:obstacle_pathway) { ObstaclePathway.new(direction: 'south') }
  let(:room) { Room.new(key: 'old stone wall', pathways: [pathway, obstacle_pathway]) }

  context 'available directions' do
    it "maps the directions of the room's pathways" do
      room.available_directions.should == ['north', 'south']
    end
  end

  context 'pathway in direction' do
    it 'gives the pathway in the direction requested' do
      room.pathway_in_direction('north').should == pathway
    end

    it 'returns nil if there is no pathway in that direction' do
      room.pathway_in_direction('east').should be_nil
    end
  end

  context 'obstacles' do
    it 'returns the obstacle pathways' do
      room.obstacles.should == [obstacle_pathway]
    end
  end

end

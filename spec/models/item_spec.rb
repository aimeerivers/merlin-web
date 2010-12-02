require 'spec_helper'

describe Item do
  let(:room) { mock(:room, key: 'old stone wall') }
  let(:pathway) { mock(:obstacle_pathway, item: 'ladder', result: 'The ladder leans against the wall') }

  context 'using an item' do
    before do
      ObstaclePathway.stub(:from_room) { [] }
    end

    it 'gets all the obstacles for that room' do
      ObstaclePathway.should_receive(:from_room).with(room.key)
      Item.use('ladder', room)
    end

    it 'tries the obstacles to see whether they respond to the item' do
      ObstaclePathway.stub(:from_room) { [pathway] }
      Item.use('ladder', room).should == 'The ladder leans against the wall'
    end

    it 'returns "Nothing happens" if the obstacles are not overcome' do
      ObstaclePathway.stub(:from_room) { [pathway] }
      Item.use('cake', room).should == 'Nothing happens.'
    end

    it 'returns "Nothing happens" if there are no obstacles for the room' do
      ObstaclePathway.stub(:from_room) { [] }
      Item.use('cake', room).should == 'Nothing happens.'
    end

    it 'returns the first successful response' do
      other_pathway = mock(:obstacle_pathway, item: 'apple')
      ObstaclePathway.stub(:from_room) { [other_pathway, pathway] }
      Item.use('ladder', room).should == 'The ladder leans against the wall'
    end
  end

end

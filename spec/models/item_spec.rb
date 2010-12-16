require 'spec_helper'

describe Item do
  let(:room) { mock(:room, key: 'old stone wall') }
  let(:pathway) { mock(:obstacle_pathway, item: 'ladder', result: 'The ladder leans against the wall') }

  context 'using an item' do
    before do
      room.stub(:obstacles) { [] }
    end

    it 'gets all the obstacles for that room' do
      room.should_receive(:obstacles)
      Item.use('ladder', room)
    end

    it 'tries the obstacles to see whether they respond to the item' do
      room.stub(:obstacles) { [pathway] }
      Item.use('ladder', room).should == 'The ladder leans against the wall'
    end

    it 'returns "Nothing happens" if the obstacles are not overcome' do
      room.stub(:obstacles) { [pathway] }
      Item.use('cake', room).should == 'Nothing happens.'
    end

    it 'returns "Nothing happens" if there are no obstacles for the room' do
      Item.use('cake', room).should == 'Nothing happens.'
    end

    it 'returns the first successful response' do
      other_pathway = mock(:obstacle_pathway, item: 'apple')
      room.stub(:obstacles) { [other_pathway, pathway] }
      Item.use('ladder', room).should == 'The ladder leans against the wall'
    end
  end

  context 'methods requiring data' do
    before do
      Item.create!(name: 'cake', initial_room: 'trees', score: 3)
      Item.create!(name: 'apple', initial_room: 'trees', score: 3)
      Item.create!(name: 'emerald', initial_room: 'trees', score: 11)
    end

    after do
      Item.destroy_all
    end

    it 'score for given items' do
      Item.score_for_items(['cake', 'apple']).should == 6
    end

    it 'best possible score for all the items' do
      Item.best_possible_score.should == 17
    end

    it 'items by name' do
      Item.all_by_name.should == ['apple', 'cake', 'emerald']
    end
  end

end

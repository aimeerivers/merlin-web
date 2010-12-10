require 'spec_helper'

describe Adventure do
  let(:adventure) { Adventure.new }
  let(:start_room) { mock(:room, key: 'start') }
  let(:trees_room) { mock(:room, key: 'trees') }
  let(:grassy_bank) { mock(:room, key: 'grassy bank') }

  before do
    Item.stub(:all) { [mock(:item, name: 'mirror', initial_room: 'deep river'), mock(:item, name: 'cake', initial_room: 'trees')] }
    Room.stub(:by_key).with('start') { start_room }
  end

  context 'a new adventure' do
    it 'starts at the grassy bank' do
      Room.should_receive(:by_key).with('start')
      Adventure.new.current_room.should == start_room
    end

    it 'sets up the items' do
      Item.should_receive(:all)
      adventure.items_in_current_room.should == []
      adventure.items_in('deep river').should == ['mirror']
    end

    it 'sets the inventory to be empty' do
      adventure.inventory.should be_empty
    end

    it 'sets no currently using item' do
      adventure.currently_using.should be_nil
    end

    it 'sets the score to zero' do
      adventure.score.should == 0
    end
  end

  context 'moving around' do
    let(:pathway) { mock(:pathway, traverse: 'trees') }

    before do
      Room.stub(:by_key).with('trees') { trees_room }
      start_room.stub(:pathway_in_direction) { pathway }
      Room.stub(:by_key).with('trees') { trees_room }
    end

    it 'does not move with invalid input' do
      current_room = adventure.current_room
      start_room.stub(:pathway_in_direction) { nil }
      lambda { adventure.move('hackhackhack') }.should raise_error(AdventureErrors::CannotGoThatWayError)
      adventure.current_room.should == current_room
    end

    it 'does not change room if the room cannot be found' do
      current_room = adventure.current_room
      Room.stub(:by_key).with('trees') { nil }
      lambda { adventure.move('south') }.should raise_error(AdventureErrors::CannotGoThatWayError)
      adventure.current_room.should == current_room
    end

    it 'finds a path that links from the current room in that direction' do
      start_room.should_receive(:pathway_in_direction).with('north')
      adventure.move('north')
    end

    context 'when it finds a path going to a different room' do
      it 'traverses the pathway with the current item being used' do
        adventure.send(:set_currently_using, 'ladder')
        pathway.should_receive(:traverse).with('ladder')
        adventure.move('north')
      end

      it 'changes to that room' do
        adventure.move('north')
        adventure.current_room.should == trees_room
      end

      it 'stops using any item that was being used' do
        adventure.send(:set_currently_using, 'ladder')
        adventure.move('north')
        adventure.currently_using.should be_nil
      end
    end

    context 'available directions' do
      it 'gets the current directions from the current room' do
        directions = mock(:array)
        start_room.should_receive(:available_directions) { directions }
        adventure.available_directions.should == directions
      end
    end

    context 'when it finds no path in that direction' do
      it 'does nothing' do
        current_room = adventure.current_room
        start_room.stub(:pathway_in_direction) { nil }
        lambda { adventure.move('north') }.should raise_error(AdventureErrors::CannotGoThatWayError)
        adventure.current_room.should == current_room
      end
    end

    context 'when the path cannot be traversed (because of an obstacle)' do
      it 'fails and passes on the error' do
        current_room = adventure.current_room
        pathway.stub(:traverse).and_raise(AdventureErrors::CannotPassError.new('The wall is too high.'))
        lambda { adventure.move('west') }.should raise_error(AdventureErrors::CannotPassError, 'The wall is too high.')
        adventure.current_room.should == current_room
      end

      it 'sets the adventure to game_over when the obstacle is fatal' do
        pathway.stub(:traverse).and_raise(AdventureErrors::FatalCannotPassError.new('You are swept away by the current.'))
        lambda { adventure.move('south') }.should raise_error(AdventureErrors::CannotPassError, 'You are swept away by the current.')
        adventure.should be_over
      end
    end

  end

  context 'updating the score' do
    it 'calculates the score after dropping an item' do
      Room.stub(:by_key).with('grassy bank') { grassy_bank }
      adventure.send(:set_current_room, 'grassy bank')
      Item.should_receive(:score_for_items).with(['cake']) { 3 }
      adventure.send(:set_inventory, ['cake'])
      adventure.drop_item('cake')
      adventure.score.should == 3
    end

    it 'calculates the score after taking an item' do
      Room.stub(:by_key).with('trees') { trees_room }
      adventure.send(:set_current_room, 'trees')
      Item.should_receive(:score_for_items).with([]) { 0 }
      adventure.take_item('cake')
      adventure.score.should == 0
    end
  end

  context 'taking an item' do
    before do
      Room.stub(:by_key).with('trees') { trees_room }
      adventure.send(:set_current_room, 'trees')
    end

    it 'verifies that the item is actually in the room' do
      lambda { adventure.take_item('apple') }.should raise_error(AdventureErrors::ItemNotHereError)
      adventure.inventory.include?('apple').should be_false
    end

    it 'adds the item to the inventory' do
      adventure.take_item('cake')
      adventure.inventory.include?('cake').should be_true
    end

    it 'removes the item from the room' do
      adventure.take_item('cake')
      adventure.items_in_current_room.include?('cake').should be_false
    end

    it 'does not allow more than 5 items to be taken' do
      adventure.send(:set_inventory, ['harp', 'water', 'apple', 'ladder', 'rope'])
      lambda { adventure.take_item('cake') }.should raise_error(AdventureErrors::CarryingTooMuchError)
    end
  end

  context 'dropping an item' do
    before do
      adventure.send(:set_inventory, ['cake'])
      Item.stub(:score_for_items) { 0 }
    end

    it 'verifies that the item is in the inventory' do
      adventure.drop_item('apple').should be_false
    end

    it 'removes the item from the inventory' do
      adventure.drop_item('cake')
      adventure.inventory.include?('cake').should be_false
    end

    it 'stops using the item if it was using it' do
      adventure.send(:set_currently_using, 'cake')
      adventure.drop_item('cake')
      adventure.currently_using.should be_nil
    end

    it 'keeps using any other item' do
      adventure.send(:set_currently_using, 'ladder')
      adventure.drop_item('cake')
      adventure.currently_using.should == 'ladder'
    end

    it 'leaves the item in the current room' do
      adventure.drop_item('cake')
      adventure.items_in_current_room.include?('cake').should be_true
    end
  end

  context 'using an item' do
    before do
      adventure.send(:set_inventory, ['ladder'])
      Item.stub(:use) { 'Nothing happens.' }
    end

    it 'verifies that the item is in the inventory' do
      adventure.use_item('apple').should be_false
    end

    it 'returns the result of using the item' do
      Item.should_receive(:use).with('ladder', adventure.current_room)
      adventure.use_item('ladder').should == 'Nothing happens.'
    end

    it 'sets the item as the currently used item' do
      adventure.use_item('ladder')
      adventure.currently_using.should == 'ladder'
    end
  end

  context 'quitting adventure' do
    it 'sets the adventure state to be over' do
      adventure.should_not be_over
      adventure.quit!
      adventure.should be_over
    end
  end
end

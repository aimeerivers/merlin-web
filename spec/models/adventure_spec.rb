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
      adventure.description.should =~ /On a grassy bank a figure lies sleeping/
    end

    it 'does not move with invalid input' do
      current_room = adventure.current_room
      adventure.move('hackhackhack')
      adventure.current_room.should == current_room
    end
  end

end

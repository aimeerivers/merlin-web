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
  end

end

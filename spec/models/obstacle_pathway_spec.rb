require 'spec_helper'

describe ObstaclePathway do

  context 'traversing' do
    let(:pathway) { ObstaclePathway.new(item: 'ladder', going_to: 'old wall') }

    it 'raises an error if the item does not work' do
      lambda { pathway.traverse }.should raise_error(AdventureErrors::CannotPassError)
    end

    it 'raises a fatal error if the obstacle is fatal without the item' do
      pathway.stub(:fatal_without_item) { true }
      lambda { pathway.traverse }.should raise_error(AdventureErrors::FatalCannotPassError)
    end

    it 'returns the target room key if the item works' do
      pathway.traverse('ladder').should == 'old wall'
    end
  end

end

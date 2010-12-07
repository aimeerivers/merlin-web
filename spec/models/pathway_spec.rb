require 'spec_helper'

describe Pathway do

  context 'traversing a pathway' do
    let(:pathway) { Pathway.new(going_to: 'old stone wall') }

    it 'provides the key of the room it goes to' do
      pathway.traverse.should == 'old stone wall'
    end
  end

end

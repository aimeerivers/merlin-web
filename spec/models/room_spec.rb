require 'spec_helper'

describe Room do

  context 'room name' do
    it 'is the key of the room, titleized' do
      Room.new(key: 'old stone wall').name.should == 'Old Stone Wall'
    end
  end

end

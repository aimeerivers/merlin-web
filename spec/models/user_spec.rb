require 'spec_helper'

describe User do

  let(:user) { User.new(preferredUsername: 'my name') }

  context 'name' do
    it 'uses the preferredUsername' do
      user.name.should == 'my name'
    end
  end

end

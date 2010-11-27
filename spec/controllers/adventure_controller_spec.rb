require 'spec_helper'

describe AdventureController do

  context 'playing adventure' do
    context 'when no adventure currently in progress' do
      let(:adventure) { mock(:adventure) }

      before do
        Adventure.stub(:new) { adventure }
      end

      it 'makes a new adventure' do
        Adventure.should_receive(:new)
        get :play
      end

      it 'provides adventure details to the view' do
        get :play
        assigns(:adventure).should == adventure
      end
    end
  end

end

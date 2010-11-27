require 'spec_helper'

describe AdventureController do
  let(:adventure) { mock(:adventure) }

  context 'playing adventure' do
    context 'when no adventure currently in progress' do

      before do
        Adventure.stub(:new) { adventure }
      end

      it 'makes a new adventure' do
        Adventure.should_receive(:new)
        get :play
      end

      it 'saves the adventure' do
        get :play
        session[:adventure].should == adventure
      end

    end
  end

  context 'moving around' do
    before do
      session[:adventure] = adventure
    end

    it 'moves in the direction requested' do
      adventure.should_receive(:move).with('north')
      get :move, direction: 'north'
    end
  end

end

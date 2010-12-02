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

  context 'deliberately starting a new adventure' do
    it 'starts a new adventure from scratch' do
      Adventure.should_receive(:new)
      get :new
    end

    it 'redirects to playing the adventure' do
      get :new
      response.should redirect_to(adventure_path)
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

    it 'adds a flash message when you cannot move that way' do
      adventure.stub(:move) { false }
      get :move, direction: 'west'
      flash[:error].should_not be_blank
    end

    it 'shows an error message when you cannot pass' do
      adventure.stub(:move).and_raise(AdventureErrors::CannotPassError.new('The wall is too high.'))
      get :move, direction: 'west'
      flash[:notice].should == 'The wall is too high.'
    end
  end

end

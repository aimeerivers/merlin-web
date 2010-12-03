require 'spec_helper'

describe AdventureController do
  let(:adventure) { mock(:adventure, over?: false) }

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

      it 'shows the adventure over page if the adventure is over' do
        adventure.stub(:over?) { true }
        get :play
        response.should render_template(:adventure_over)
      end

      it 'shows the adventure page if the adventure is in progress' do
        adventure.stub(:over?) { false }
        get :play
        response.should render_template(:play)
      end

    end
  end

  context 'deliberately starting a new adventure' do
    before do
      Adventure.stub(:new) { adventure }
    end

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
      adventure.stub(:move).and_raise(AdventureErrors::CannotGoThatWayError)
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

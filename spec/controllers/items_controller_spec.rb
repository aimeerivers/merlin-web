require 'spec_helper'

describe ItemsController do
  let(:adventure) { mock(:adventure, take_item: true, drop_item: true) }

  before do
    session[:adventure] = adventure
  end

  context 'taking an item' do
    it 'tells the adventure to take the item' do
      adventure.should_receive(:take_item).with('mirror')
      get :take, item: 'mirror'
    end

    it 'provides feedback when you cannot take the item' do
      adventure.stub(:take_item) { false }
      get :take, item: 'mirror'
      flash[:error].should_not be_blank
    end

    it 'redirects to the adventure' do
      get :take, item: 'mirror'
      response.should redirect_to adventure_path
    end
  end

  context 'dropping an item' do
    it 'tells the adventure to drop the item' do
      adventure.should_receive(:drop_item).with('mirror')
      get :drop, item: 'mirror'
    end

    it 'provides feedback when you cannot drop the item' do
      adventure.stub(:drop_item) { false }
      get :drop, item: 'mirror'
      flash[:error].should_not be_blank
    end

    it 'redirects to the adventure' do
      get :drop, item: 'mirror'
      response.should redirect_to adventure_path
    end
  end

end

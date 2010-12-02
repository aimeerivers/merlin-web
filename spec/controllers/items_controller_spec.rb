require 'spec_helper'

describe ItemsController do
  let(:adventure) { mock(:adventure, take_item: true, drop_item: true, use_item: true) }

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

  context 'using an item' do
    it 'tells the adventure to use the item' do
      adventure.should_receive(:use_item).with('ladder')
      get :use, item: 'ladder'
    end

    it 'shows a notice message if something happens' do
      adventure.stub(:use_item) { 'The ladder leans against the wall.' }
      get :use, item: 'ladder'
      flash[:notice].should == 'The ladder leans against the wall.'
    end

    it 'shows an error message if you do not have the item' do
      adventure.stub(:use_item) { false }
      get :use, item: 'ladder'
      flash[:error].should == 'You do not have that item.'
    end

    it 'redirects to the adventure' do
      get :use, item: 'ladder'
      response.should redirect_to adventure_path
    end
  end

end

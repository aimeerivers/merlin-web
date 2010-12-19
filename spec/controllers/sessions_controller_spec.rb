require 'spec_helper'

describe SessionsController do

  context 'signing in with engage' do
    let(:user) { mock(:user, identifier: mock, name: mock) }

    before do
      User.stub(:from_engage_token) { user }
    end

    it 'processes the engage token' do
      User.should_receive(:from_engage_token).with(:token)
      post :create, token: :token
    end

    it 'saves the current user identifier' do
      post :create, token: '12345'
      session[:current_user_identifier].should == user.identifier
    end

    it 'redirects to the menu' do
      post :create, token: '12345'
      flash[:notice].should_not be_blank
      response.should redirect_to choice_path
    end
  end

  context 'signing out' do
    it 'clears the current user identifier' do
      session[:current_user_identifier] = 'something'
      get :destroy
      session[:current_user_identifier].should be_nil
    end

    it 'redirects to the menu' do
      get :destroy
      flash[:notice].should_not be_blank
      response.should redirect_to choice_path
    end
  end

end

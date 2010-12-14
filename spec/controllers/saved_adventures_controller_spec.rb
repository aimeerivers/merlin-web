require 'spec_helper'

describe SavedAdventuresController do

  let(:current_user) { mock_model(User) }

  before do
    session[:current_user_identifier] = current_user.id
    controller.stub(:current_user) { current_user }
  end

  def mock_saved_adventure(stubs={})
    (@mock_saved_adventure ||= mock_model(SavedAdventure).as_null_object).tap do |saved_adventure|
      saved_adventure.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all the current user's saved_adventures as @saved_adventures" do
      current_user.stub_chain(:saved_adventures, :newest_first) { [mock_saved_adventure] }
      get :index
      assigns(:saved_adventures).should eq([mock_saved_adventure])
    end
  end

  describe "GET new" do
    it "assigns a new saved_adventure as @saved_adventure" do
      SavedAdventure.stub(:new) { mock_saved_adventure }
      get :new
      assigns(:saved_adventure).should be(mock_saved_adventure)
    end
  end

  describe "POST create" do

    before do
      SavedAdventure.stub(:new) { mock_saved_adventure(save: true) }
    end

    it "saves the adventure for the current user" do
      SavedAdventure.should_receive(:new).with(hash_including({user_id: current_user.id}))
      post :create, saved_adventure: {name: 'name'}
    end

    it "saves the current adventure state" do
      serialized_adventure = mock
      ActiveSupport::JSON.stub(:encode).with(controller.send(:adventure)) { serialized_adventure }
      SavedAdventure.should_receive(:new).with(hash_including({adventure: serialized_adventure}))
      post :create, saved_adventure: {name: 'name'}
    end

    describe "with valid params" do
      it "assigns a newly created saved_adventure as @saved_adventure" do
        SavedAdventure.stub(:new).with(hash_including({'these' => 'params'})) { mock_saved_adventure(:save => true) }
        post :create, :saved_adventure => {'these' => 'params'}
        assigns(:saved_adventure).should be(mock_saved_adventure)
      end

      it "redirects back to the adventure" do
        SavedAdventure.stub(:new) { mock_saved_adventure(:save => true) }
        post :create, :saved_adventure => {}
        response.should redirect_to(adventure_path)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved saved_adventure as @saved_adventure" do
        SavedAdventure.stub(:new).with(hash_including({'these' => 'params'})) { mock_saved_adventure(:save => false) }
        post :create, :saved_adventure => {'these' => 'params'}
        assigns(:saved_adventure).should be(mock_saved_adventure)
      end

      it "re-renders the 'new' template" do
        SavedAdventure.stub(:new) { mock_saved_adventure(:save => false) }
        post :create, :saved_adventure => {}
        response.should render_template("new")
      end
    end

  end

  describe "restoring a saved adventure" do
    let(:saved_adventure) { mock }
    let(:encoded_adventure) { mock }
    let(:decoded_adventure) { mock }
    let(:adventure) { mock }

    before do
      SavedAdventure.stub(:find) { saved_adventure }
      Adventure.stub(:new) { adventure }
      adventure.stub(:restore) { adventure }
      saved_adventure.stub(:adventure) { encoded_adventure }
      ActiveSupport::JSON.stub(:decode).with(encoded_adventure) { decoded_adventure }
    end

    it "finds the saved adventure" do
      SavedAdventure.should_receive(:find).with(:saved_adventure_id)
      get :restore, id: :saved_adventure_id
    end

    it "restores the adventure" do
      adventure.should_receive(:restore).with(decoded_adventure)
      get :restore, id: :saved_adventure_id
    end

    it "redirects to the adventure page" do
      get :restore, id: :saved_adventure_id
      response.should redirect_to(adventure_path)
    end
  end

end

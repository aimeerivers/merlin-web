require 'spec_helper'

describe ScoresController do

  context 'showing top scores' do
    let(:scores) { mock(:scores) }

    before do
      Score.stub(:top) { scores }
    end

    it 'gets the top scores' do
      Score.should_receive(:top) { scores }
      get :index
    end

    it 'populates the scores instance variable' do
      get :index
      assigns[:scores].should == scores
    end
  end

  context 'creating a new top score' do
    let (:score) { mock(:score, name: 'aimee', score: 18, save: true) }

    before do
      session[:adventure] = mock(:adventure, score: 18)
      Score.stub(:new) { score }
    end

    it 'makes a score with the name given and the adventure score' do
      Score.should_receive(:new).with('name' => 'aimee', 'score' => 18)
      post :create, score: {name: 'aimee'}
    end

    it 'tries to save the score' do
      score.should_receive(:save)
      post :create, score: {name: 'aimee'}
    end

    context 'when the score is saved successfully' do
      before do
        score.stub(:save) { true }
      end

      it 'saves the name in the session' do
        post :create, score: {name: 'aimee'}
        session[:name].should == 'aimee'
      end

      it 'redirects to the scores page' do
        post :create, score: {name: 'aimee'}
        response.should redirect_to scores_path
      end
    end

    context 'when the score cannot be saved' do
      before do
        score.stub(:save) { false }
      end

      it 'renders the new score page' do
        post :create, score: {name: 'aimee'}
        response.should render_template(:new)
      end

      it 'populates the score instance variable' do
        post :create, score: {name: 'aimee'}
        assigns[:score].should == score
      end
    end
  end

end

require 'spec_helper'

describe ApplicationHelper do

  context 'arrow and link in a direction' do
    it 'includes a div tag' do
      helper.move_link('north').should have_tag('div.go-north')
    end

    it 'includes a link to move' do
      helper.move_link('north').should have_tag("a[href='/go/north']")
    end

    it 'includes an arrow image' do
      helper.move_link('north').should have_tag("img[src^='/images/go-north.jpg']")
    end

    it 'includes a title for the image' do
      helper.move_link('north').should have_tag("img[title='Go North']")
    end
  end

end

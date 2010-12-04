require 'spec_helper'

describe ApplicationHelper do

  context 'arrow and direction_arrow in a direction' do
    context 'when the direction is available' do
      def direction_arrow
        helper.direction_arrow('north', ['north'])
      end

      it 'includes a div tag' do
        direction_arrow.should have_tag('div.go-north')
      end

      it 'includes a direction_arrow to move' do
        direction_arrow.should have_tag("a[href='/go/north']")
      end

      it 'includes an arrow image' do
        direction_arrow.should have_tag("img[src^='/images/go-north.jpg']")
      end

      it 'includes a title for the image' do
        direction_arrow.should have_tag("img[title='Go North']")
      end
    end

    context 'when the direction is not available' do
      def direction_arrow
        helper.direction_arrow('south', ['north', 'east'])
      end

      it 'includes the div tag' do
        direction_arrow.should have_tag('div.go-south')
      end

      it 'does not include the direction_arrow' do
        direction_arrow.should_not have_tag('a')
      end

      it 'does not include the image' do
        direction_arrow.should_not have_tag('img')
      end
    end
  end

end

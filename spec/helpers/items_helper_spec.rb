require 'spec_helper'

describe ItemsHelper do

  context 'indefinite article for an item' do
    it 'uses "an" for vowels' do
      item_with_indefinite_article('apple').should == 'an apple'
    end

    it 'uses "a" for consonants' do
      item_with_indefinite_article('cake').should == 'a cake'
    end

    it 'uses "some" for gold' do
      item_with_indefinite_article('gold').should == 'some gold'
    end

    it 'uses "some" for silver' do
      item_with_indefinite_article('silver').should == 'some silver'
    end

    it 'uses "some" for water' do
      item_with_indefinite_article('water').should == 'some water'
    end
  end

end

require 'spec_helper'

describe ItemsHelper do

  context 'indefinite article for an item' do
    it 'uses "an" for vowels' do
      item_with_indefinite_article('apple').should == 'an apple'
    end

    it 'uses "a" for consonants' do
      item_with_indefinite_article('cake').should == 'a cake'
    end

    it 'uses no article for gold' do
      item_with_indefinite_article('gold').should == 'gold'
    end

    it 'uses no article for silver' do
      item_with_indefinite_article('silver').should == 'silver'
    end

    it 'uses no article for water' do
      item_with_indefinite_article('water').should == 'water'
    end
  end

end

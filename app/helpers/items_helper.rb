module ItemsHelper

  def item_with_indefinite_article(item)
    "#{indefinite_article(item)}#{item}"
  end

  private

  def indefinite_article(item)
    return '' if %(gold silver).include? item
    return 'an ' if %w(a e i o u).include? item.chars.first
    'a '
  end

end

module ItemsHelper

  def item_with_indefinite_article(item)
    "#{indefinite_article(item)} #{item}"
  end

  private

  def indefinite_article(item)
    return 'some' if %(gold silver water).include? item
    return 'an' if %w(a e i o u).include? item.chars.first
    return 'a'
  end

end

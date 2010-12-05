module AdventureErrors
  class CannotGoThatWayError < StandardError; end
  class CannotPassError < StandardError; end
  class FatalCannotPassError < StandardError; end
  class CarryingTooMuchError < StandardError; end
  class ItemNotHereError < StandardError; end
end

class Adventure

  MAX_ITEMS = 5

  attr_reader :current_room, :inventory, :currently_using

  def initialize
    set_up_items
    set_inventory([])
    set_currently_using(nil)
    set_current_room('start')
    set_game_in_progress
  end

  def move(direction)
    pathway = Pathway.from_room_in_direction(current_room.key, direction)
    raise AdventureErrors::CannotGoThatWayError if pathway.nil?
    traverse(pathway)
  end

  def description
    current_room.description
  end

  def available_directions
    current_room.available_directions
  end

  def items_in(room)
    @items.select{|k,v| v == room}.keys
  end

  def items_in_current_room
    items_in(@current_room.key)
  end

  def take_item(item_name)
    raise AdventureErrors::ItemNotHereError unless item_in_current_room?(item_name)
    raise AdventureErrors::CarryingTooMuchError if @inventory.size >= MAX_ITEMS
    remove_item_from_room(item_name)
    @inventory << item_name
  end

  def drop_item(item_name)
    return false unless @inventory.include?(item_name)
    set_currently_using(nil) if @currently_using == item_name
    @inventory.delete(item_name)
    put_item_in_current_room(item_name)
  end

  def use_item(item_name)
    return false unless @inventory.include?(item_name)
    set_currently_using(item_name)
    Item.use(item_name, @current_room)
  end

  def quit!
    set_game_over
  end

  def over?
    @game_over
  end

  private

  def set_current_room(key)
    room = Room.by_key(key)
    raise AdventureErrors::CannotGoThatWayError if room.nil?
    set_currently_using(nil)
    @current_room = room
  end

  def set_inventory(items)
    @inventory = items
  end

  def set_currently_using(item)
    @currently_using = item
  end

  def set_up_items
    @items = Hash.new
    Item.all.each do |item|
      @items[item.name] = item.initial_room
    end
  end

  def traverse(pathway)
    begin
      set_current_room(pathway.traverse(@currently_using))
    rescue AdventureErrors::FatalCannotPassError => e
      set_game_over
      raise AdventureErrors::CannotPassError, e.message
    end
  end

  def set_game_over
    @game_over = true
  end

  def set_game_in_progress
    @game_over = false
  end

  def item_in_current_room?(item_name)
    items_in_current_room.include?(item_name)
  end

  def remove_item_from_room(item_name)
    @items.delete(item_name)
  end

  def put_item_in_current_room(item_name)
    @items[item_name] = current_room.key
  end

end

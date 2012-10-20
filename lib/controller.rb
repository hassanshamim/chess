#A nice way to require all the gamepieces

class Controller

  #create master array of all pieces
  #create turn array, change turn method, and check turn-color = piece color
  #Accept input for player 1 and 2 names before gamestart

  attr_reader  :player_name, :turn_color

  def initialize(name1, name2)
    @player_cycle = [name1, name2].cycle
    @turn_cycle = [:white, :black].cycle
    change_turn
  end


  def change_turn
    @turn_color = @turn_cycle.next
    @player_name = @player_cycle.next
    self
  end
  #create master array of all pieces
  #create turn array, change turn method, and check turn-color = piece color
  #Accept input for player 1 and 2 names before gamestart

  #
end

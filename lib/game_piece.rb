class GamePiece

  attr_reader :color
  attr_accessor :rank, :file

  @@all_pieces = Array.new

  def initialize ( color, file, rank )
    @color, @rank, @file = color, rank, file
    @alive = true
    @@all_pieces << self  #MOVE THIS SOMEWHERE ELSE
  end

  def position
    [ file, rank ]
  end

  def kill
    @alive = false
    @rank, @file = nil, nil
  end

  alias :seppuku :kill 

  def active?
    @alive
  end

  def color_initial
    color.to_s[ 0, 1].upcase
  end

  def initials
    color_initial + piece_initial   #template method, piece_initial defined in subclasses
  end

end

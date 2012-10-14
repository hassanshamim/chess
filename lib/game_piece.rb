class GamePiece

  attr_reader :color
  attr_accessor :rank, :file

  def initialize ( color, file, rank )
    @color, @rank, @file = color, rank, file
    @alive = true
  end

  def position
    [ file, rank ]
  end

  def kill
    @alive = false
    @rank = nil
    @file = nil
  end

  def active?
    @alive
  end

  def display_initials
    color_initial = color.to_s.upcase[0,1]
    color_initial << piece_initial
    #this is where I expect super to be called in the descendent classes
  end

end

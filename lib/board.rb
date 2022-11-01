class Board 
  
  def initialzie(grid=Array.new(6) { Array.new(7) })
    @grid = grid
  end 

  def add_piece(player, column)
    # add piece for a player
  end

  def to_s 
  end

  def column_full?(column)
    # check if column's full
  end

  def game_over?
    # check if anyone has won or if it is a tie
  end 
end
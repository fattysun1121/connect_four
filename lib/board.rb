class Board 
  def initialize(grid=Array.new(6) { Array.new(7) })
    @grid = grid
  end 

  def add_piece(player, player_col)
    if player_col - 1 < 0 || player_col - 1 >= 7
      puts 'Please choose from column 1 - 7!'
      return false
    end
    row = lowest_empty_row(player_col - 1)
    if row == -1 
      puts 'The column is full, please pick another column.'
      return false
    end
    @grid[row][player_col - 1] = player
    true
  end

  def to_s
    string_rep = ''
    @grid.each do |row|
      row.each do |col|
        if col.nil?
          string_rep += '⚪ '
        elsif col == 'soccer'
          string_rep += '⚽ '
        else
          string_rep += '⚾ '
        end
      end
      string_rep += "\n"
    end
    string_rep
  end
  
  def game_over?
    # check horizontal
    
    # check vertical
    # check diagonal
  end 

  private 
   
  def lowest_empty_row(column)
    @grid.length.times do |i|
      row = @grid.length - 1 - i
      return row if @grid[row][column].nil?
    end
    return -1 
  end
end
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
    @grid.each do |row|
      case row
      in [*, 'soccer', 'soccer', 'soccer', 'soccer', *]
        return 'soccer'
      in [*, 'baseball', 'baseball', 'baseball', 'baseball', *]
        return 'baseball'
      else
      end
    end

    # check vertical
    columns = 7.times.map do |col|
      column = []
      @grid.each do |row|
        column << row[col]
      end
      column
    end

    columns.each do |col|
      case col
      in [*, 'soccer', 'soccer', 'soccer', 'soccer', *]
        return 'soccer'
      in [*, 'baseball', 'baseball', 'baseball', 'baseball', *]
        return 'baseball'
      else
      end
    end

    # check diagonal
    3.times do |row|
      4.times do |col|
        left_diagonal = [@grid[row][col], @grid[row + 1][col + 1], @grid[row + 2][col + 2], @grid[row + 3][col + 3]]
        right_diagonal = [@grid[row][col + 3], @grid[row + 1][col + 2], 
                          @grid[row + 2][col + 1], @grid[row + 3][col]]
        diagonals = [left_diagonal, right_diagonal]
        diagonals.each do |diagonal|
          case diagonal
          in [*, 'soccer', 'soccer', 'soccer', 'soccer', *]
            return 'soccer'
          in [*, 'baseball', 'baseball', 'baseball', 'baseball', *]
            return 'baseball'
          else
          end
        end
      end
    end
   
    # check tie 
    if full? 
      'tie'
    else
      false
    end
  end
   
  private 
   
  def lowest_empty_row(column)
    @grid.length.times do |i|
      row = @grid.length - 1 - i
      (return row) if @grid[row][column].nil?
    end
    return -1 
  end

  def full?
    @grid[0].length.times do |i|
      return false if lowest_empty_row(i) != -1
    end
    true
  end
end
require './board.rb'
# 6 (rows) x 7 (columns) game board
# alternate between players, each dropping a piece of theirs into the game board
# checking if someone connect four pieces diagonally, vertically, or horizontally
# if the whole board is filled and no one has won yet, it is a draw

class ConnectFour
  def initialize(board=Board.new)
    # generate game board 
    # call intro
    # initialize instance variables
  end

  def toggle_player!
    # switch player
  end

  def play_again?
    # ask if the user want to play again
  end
  
  def run 
    # run the game
    # display board
    # loop until game over
    # ask for column
    # add piece 
    # switch player
    # end
    # output game over message
    # play agian?
  end

  private 

  def introduction
    # intro of the game
  end

  def end_message
    # end message of the game
  end
end
require './lib/board.rb'

describe Board do 
  describe '#add_piece' do
    subject(:board_add) { described_class.new }

    context 'when the targeted column is not full' do
      it 'adds the piece to the bottom of the corresponding column' do
        board_add.add_piece('soccer', 3)
        last_row = board_add.instance_variable_get(:@grid)[5]
        expect(last_row[2]).to eq('soccer')
      end
      
      it 'returns true' do 
        added = board_add.add_piece('soccer', 1)
        expect(added).to be true
      end
    end

    context 'when the targeted column is full' do
      before do
        6.times { board_add.add_piece('soccer', 1) }
      end

      it 'outputs an error message to the console' do 
        error_message = 'The column is full, please pick another column.'
        expect(board_add).to receive(:puts).with(error_message)
        board_add.add_piece('soccer', 1)
      end

      it 'returns false' do 
        added = board_add.add_piece('soccer', 1)
        expect(added).to be false
      end
    end

    context 'when the column is out of bounds' do 
      it 'asks the player to choose column within the bounds' do 
        ask_message= 'Please choose from column 1 - 7!'
        expect(board_add).to receive(:puts).with(ask_message)
        board_add.add_piece('soccer', 8)
      end
      
      it 'return false' do
        added = added = board_add.add_piece('soccer', 0)
        expect(added).to be false
      end
    end
  end

  describe '#to_s' do 
    subject(:board_s) { described_class.new }
    context 'when the board is empty' do
      it 'returns a string representation of an empty board' do 
        empty = "⚪ ⚪ ⚪ ⚪ ⚪ ⚪ ⚪ \n"\
                "⚪ ⚪ ⚪ ⚪ ⚪ ⚪ ⚪ \n"\
                "⚪ ⚪ ⚪ ⚪ ⚪ ⚪ ⚪ \n"\
                "⚪ ⚪ ⚪ ⚪ ⚪ ⚪ ⚪ \n"\
                "⚪ ⚪ ⚪ ⚪ ⚪ ⚪ ⚪ \n"\
                "⚪ ⚪ ⚪ ⚪ ⚪ ⚪ ⚪ \n"           
        expect(board_s.to_s).to eq(empty)
      end
    end

    context 'when one location is occupied' do 
      before do
        board_s.add_piece('soccer', 2)
      end

      it 'returns the correct string representation' do 
        one = "⚪ ⚪ ⚪ ⚪ ⚪ ⚪ ⚪ \n"\
              "⚪ ⚪ ⚪ ⚪ ⚪ ⚪ ⚪ \n"\
              "⚪ ⚪ ⚪ ⚪ ⚪ ⚪ ⚪ \n"\
              "⚪ ⚪ ⚪ ⚪ ⚪ ⚪ ⚪ \n"\
              "⚪ ⚪ ⚪ ⚪ ⚪ ⚪ ⚪ \n"\
              "⚪ ⚽ ⚪ ⚪ ⚪ ⚪ ⚪ \n"   
        expect(board_s.to_s).to eq(one)
      end
    end

    context 'when two locations of the same column are occupied' do 
      before do
        board_s.add_piece('soccer', 2)
        board_s.add_piece('baseball', 2)
      end

      it 'returns the correct string representation' do 
        two_same = """⚪ ⚪ ⚪ ⚪ ⚪ ⚪ ⚪ \n
                      ⚪ ⚪ ⚪ ⚪ ⚪ ⚪ ⚪ \n
                      ⚪ ⚪ ⚪ ⚪ ⚪ ⚪ ⚪ \n
                      ⚪ ⚪ ⚪ ⚪ ⚪ ⚪ ⚪ \n
                      ⚪ ⚾ ⚪ ⚪ ⚪ ⚪ ⚪ \n
                      ⚪ ⚽ ⚪ ⚪ ⚪ ⚪ ⚪ \n""" 
      end
    end

    context 'when two locations of different columns are occupied' do 
      before do
        board_s.add_piece('soccer', 2)
        board_s.add_piece('baseball', 4)
      end

      it 'returns the correct string representation' do 
        two_diff = """⚪ ⚪ ⚪ ⚪ ⚪ ⚪ ⚪ \n
                      ⚪ ⚪ ⚪ ⚪ ⚪ ⚪ ⚪ \n
                      ⚪ ⚪ ⚪ ⚪ ⚪ ⚪ ⚪ \n
                      ⚪ ⚪ ⚪ ⚪ ⚪ ⚪ ⚪ \n
                      ⚪ ⚪ ⚪ ⚪ ⚪ ⚪ ⚪ \n
                      ⚪ ⚽ ⚪ ⚾ ⚪ ⚪ ⚪ \n""" 
      end
    end
  end

  describe '#game_over?' do 
    subject(:board_over) { described_class.new }
    context 'when no one has connected four pieces' do
      it 'returns false' do
        over = board_over.game_over?
        expect(over).to be false
      end
    end
    context 'when soccer has connected four pieces vertically' do 
      before do
        4.times { board_over.add_piece('soccer', 3) } 
      end

      it 'returns soccer' do
        over = board_over.game_over?
        expect(over).to eq('soccer')
      end
    end

    context 'when soccer has connected four pieces horizontally' do 
      before do
        board_over.add_piece('soccer', 1)
        board_over.add_piece('soccer', 2)
        board_over.add_piece('soccer', 3)
        board_over.add_piece('soccer', 4)
      end

      it 'returns soccer' do
        over = board_over.game_over?
        expect(over).to eq('soccer')
      end
    end

    context 'when soccer has connected four pieces diagonally' do
      before do 
        3.times { board_over.add_piece('baseball', 4) }
        2.times { board_over.add_piece('baseball', 3) }
        board_over.add_piece('baseball', 2)
        board_over.add_piece('soccer', 1)
        board_over.add_piece('soccer', 2)
        board_over.add_piece('soccer', 3)
        board_over.add_piece('soccer', 4)
      end 
      
      xit 'returns soccer' do
        over = board_over.game_over?
        expect(over).to eq('soccer')
      end
    end

    context 'when no one has connected four pieces but the board is full' do 
      subject(:board_tie) { described_class.new(grid) }
      let(:grid) { [['soccer', 'soccer', 'baseball', 'soccer', 'baseball', 'baseball', 'soccer'], 
                    ['baseball', 'baseball', 'soccer', 'baseball', 'soccer', 'soccer', 'baseball'],
                    ['soccer', 'soccer', 'soccer', 'baseball', 'baseball', 'baseball', 'soccer'],
                    ['baseball', 'baseball', 'soccer', 'baseball', 'baseball', 'soccer', 'baseball'],
                    ['soccer', 'soccer', 'baseball', 'soccer', 'soccer', 'soccer', 'baseball'],
                    ['baseball', 'soccer', 'soccer', 'baseball', 'baseball', 'soccer', 'baseball']] }
      it 'returns tie' do 
        over = board_tie.game_over?
        expect(over).to eq('tie')
      end
    end
  end
end
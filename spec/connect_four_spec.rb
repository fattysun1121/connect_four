require '../lib/connect_four.rb'

describe ConnectFour do 
  subject(:connect_four) { described_class.new }

  describe '#toggle_player' do
    context 'when current player is soccer' do 
      
      it 'changes the player to baseball' do
        expect { connect_four.toggle_player }.to change{
           connect_four.instance_variable_get(:player) }.from('soccer').to('baseball')
      end
    end

    context 'when current player is baseball' do 
      before do 
        connect_four.toggle_player
      end

      it 'changes the player to soccer' do
        expect { connect_four.toggle_player }.to change {
          connect_four.instance_variable_get(:player) }.from('baseball').to('soccer')
      end
    end
  end

  describe '#play_again' do 
    context 'when players doesn\'t want to play again' do 
      before do
        allow(connect_four).to receive(:gets).and_return('n')
      end

      it 'outputs a thank you message' do
        thank_you = 'Thanks for playing!'
        expect(connect_four).to receive(:puts).with(thank_you)
        connect_four.play_again
      end
    end

    context 'when players wants to play again' do
      before do
        allow(connect_four).to receive(:gets).and_return('y')
        allow(connect_four).to receive(:run)
      end
      
      it 'runs the game again' do
        expect(connect_four).to receive(:run)
        connect_four.play_again
      end
    end
  end

  describe '#play_game' do
    context 'when soccer plays and wins' do
      it 'sends a message to check if the game is over once' do
      end

      it 'adds soccer to the board once' do
      end

      it 'asks for which column to put soccer once' do
      end

      it 'switches player once' do
      end

      it 'returns soccer' do 
      end
    end
    context 'when soccer plays, baseball plays and wins' do
      it 'sends a message to check if the game is over once' do
      end

      it 'adds soccer to the board once' do
      end

      it 'asks for which column to put soccer once' do
      end

      it 'switches player once' do
      end

      it 'returns baseball' do
      end
    end
  end
end
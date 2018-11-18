require 'game'

describe Game do

  describe '#vs_computer' do
    it 'Returns a result vs computer (computer = paper)' do
      srand(1)
      game = Game.new('Leon', 'computer')
      game.move('Paper', 'computer')
      expect(game.result).to eq "Its a draw!"
    end
    it 'Returns a result vs computer (computer = rock)' do
      srand(2)
      game = Game.new('Leon', 'computer')
      game.move('Paper', 'computer')
      expect(game.result).to eq "Leon has Won!"
    end
    it 'Returns a result vs computer (computer = Scissors)' do
      srand(3)
      game = Game.new('Leon', 'computer')
      game.move('Paper', 'computer')
      expect(game.result).to eq "Computer has Won!"
    end
  end
  describe 'vs_p2' do
    it 'Returns a result vs p2 (p1 win)' do
      game = Game.new('Leon', 'Alfred')
      game.move('Paper', 'Rock')
      expect(game.result).to eq "Leon has Won!"
    end
    it 'Returns a result vs p2 (draw)' do
      game = Game.new('Leon', 'Alfred')
      game.move('Paper', 'Paper')
      expect(game.result).to eq "Its a draw!"
    end
  end
  describe '#result_message' do
    it 'returns a suitable win message (p2 win)' do
      game = Game.new('Leon', 'Alfred')
      game.move('Rock', 'Paper')
      expect(game.result).to eq "Alfred has Won!"
    end

    it 'returns a suitable win message (draw)' do
      game = Game.new('Leon', 'Alfred')
      game.move('Rock', 'Rock')
      expect(game.result).to eq "Its a draw!"
    end
  end
end

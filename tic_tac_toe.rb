# frozen_string_literal: true

class Game
  def initialize
    @board = "  |   |   \n----------\n  |   |  \n----------\n  |   |  \n"
    puts @board
    @arr = Array.new(9) { ' ' }
    @symb = 'O'
  end

  def board_update
    puts " #{@arr[0]} | #{@arr[1]} | #{@arr[2]} \n----------\n #{@arr[3]} | #{@arr[4]} | #{@arr[5]} \n----------\n #{@arr[6]} | #{@arr[7]} | #{@arr[8]} \n"
  end

  def place(spot)
    @arr[spot - 1] = @symb
  end

  def start_game
    until @done
      choice
      done?
    end
  end

  def done?
    @win_comb = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    symb_location = @arr.each_index.select { |i| @arr[i] == @symb }
    @done = false
    if @win_comb.each_index.any? { |index| symb_location == @win_comb[index] }
      @done = true
      puts "#{@symb} wins!"
    elsif @arr.all? { |e| e != ' ' }
      @done = true
      puts "It's a draw!"
    end
  end

  def choice
    puts 'Choose a spot: (1-9)'
    begin
      spot = Kernel.gets.match(/[1-9]/)[0]
    rescue StandardError
      puts 'Erroneous input! Try again...'
      retry
    else
      @symb = if @symb == 'X'
                'O'
              else
                'X'
              end
      place(spot.to_i)
      board_update
    end
  end
end

game = Game.new

game.start_game

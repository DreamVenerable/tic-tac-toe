# frozen_string_literal: true

class Board
  @@win_comb = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

  def initialize
    @board = "  |   |   \n----------\n  |   |  \n----------\n  |   |  \n"
    puts @board
    @arr = Array.new(9) {' '}
  end

  def board_update
    puts " #{@arr[0]} | #{@arr[1]} | #{@arr[2]} \n----------\n #{@arr[3]} | #{@arr[4]} | #{@arr[5]} \n----------\n #{@arr[6]} | #{@arr[7]} | #{@arr[8]} \n"
  end

  def place(num)
    @arr[num-1] = "X"
  end

  def start_game
    while !@done
      get_choice
      done?
    end
  end
  
  def done?
    symb_location = @arr.each_index.select{|i| @arr[i] == "X"}
    @done = false
    if @@win_comb.each_index.any? { |index| symb_location == @@win_comb[index] }
      @done = true
    elsif @arr.all? { |e| e != ' '}
      @done = true
    end
  end

  def get_choice
    puts "Choose a spot: (1-9)"

    begin
      num = Kernel.gets.match(/[1-9]/)[0]
    rescue
      puts "Erroneous input! Try again..."
      retry
    else
      place(num.to_i)
      board_update
    end 
  end
end

class Player < Board
  def initialize(symbol)
    @symbol = symbol
  end
end
 


game = Board.new
PlayerX = Player.new('X')
PlayerY = Player.new('Y')

game.start_game

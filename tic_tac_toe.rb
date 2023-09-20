# frozen_string_literal: true

class Game
  def initialize
    @arr = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
    @symb = 'O'
  end

  def start_game
    board_update
    until @done
      choice
      done?
    end
  end

  private

  def board_update
    puts <<-HEREDOC

       #{@arr[6]} | #{@arr[7]} | #{@arr[8]}
      ---+---+---
       #{@arr[3]} | #{@arr[4]} | #{@arr[5]}
      ---+---+---
       #{@arr[0]} | #{@arr[1]} | #{@arr[2]}

    HEREDOC
  end

  def place(spot)
    @arr[spot - 1] = @symb
  end

  def done?
    @done = false

    if won?
      @done = true
      puts "GAME OVER! #{@symb} wins!"
    elsif full?
      @done = true
      puts "It's a draw!"
    end
  end

  def won?
    @win_comb = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    @win_comb.any? { |elem| elem.all? { |spot| @arr[spot] == @symb } }
  end

  def full?
    @arr.all? { |e| e != ' ' }
  end

  def choice
    puts 'Choose a spot: (1-9)'
    begin
      @spot = gets.match(/[1-9]/)[0]
    rescue StandardError
      puts 'Wrong input, Try again!'
      retry
    else
      update_game
    end
  end

  def change_symbol
    @symb = if @symb == 'X'
              'O'
            else
              'X'
            end
  end

  def update_game
    change_symbol
    place(@spot.to_i)
    board_update
  end
end

game = Game.new.start_game

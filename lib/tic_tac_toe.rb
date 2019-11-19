require 'pry'
class TicTacToe

  attr_accessor :input
  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [

    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
                      ]

  def display_board

    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "

  end

  def input_to_index(input)
    puts "enter move"
    input.to_i - 1

  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)

      if @board[index] == "X"
        return true
      elsif @board[index] == "O"
        return true
      else
        return false
      end
    end

  def valid_move?(position)
    position.between?(0,8) && !position_taken?(position)
  end

  def turn_count

    @board.count do |number|
      number != " "
    end
  end


  def current_player

    if turn_count.even?
      return "X"
    else
      return "O"
    end
  end

  def turn

    test_input = gets.strip
    index = input_to_index(test_input)

    if valid_move?(index)
      move(index, current_player)
      display_board

    else
      turn
      move(index, current_player)
    end

  end

  def won?

    WIN_COMBINATIONS.each do |combo|
      one = combo[0]
      two = combo[1]
      three = combo[2]


      one_check = @board[one]
      two_check = @board[two]
      three_check = @board[three]

      if one_check == "O" && two_check == "O" && three_check == "O"
        return combo
      elsif
        one_check == "X" && two_check == "X" && three_check == "X"
        return combo
      end
    end
    return false
  end


  def full?

counter = 0
    @board.each do |check|
      if check == "X" || check == "O"
        counter += 1
      end
    end
    if counter == 9
      return true
    elsif counter != 9
      return false
    end
  end

  def draw?

    if full? == true && won? == false
      return true
    else
      return false
    end
  end


  def over?
    if draw?  || won?
      return true
    else return false
    end
  end

  def winner
    winning_array = []
    winning_array = won?

    if winning_array == false
      return nil
    elsif @board[winning_array[0]] == "X"
      return "X"
    elsif @board[winning_array[0]] == "O"
      return "O"
    end

  end

  def play
    until over? == true
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
      over = true
  #binding.pry
    elsif draw?
      puts "Cat's Game!"
      over = true


    end
  end



end

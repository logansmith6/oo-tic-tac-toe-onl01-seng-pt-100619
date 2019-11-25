require 'pry'

class TicTacToe
  attr_accessor :input
  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end
  
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    puts "please provide the position by choosing a number between 1 to 9. "
    input.to_i-1
    # binding.pry
  end
  
  def move(index,token="X")
    @board[index] = token
    # @board[4] = "O"
      # binding.pry
  end
  
  def position_taken?(index)
    @board[index] != " " 
  end
  
  def valid_move?(index) #valid if the index(position) is within 0 to 8 and it is in fact, being empty to place your game on. 
    index.between?(0, 8) && !position_taken?(index) #if input_to_index is between 0 to 8 AND position is empty
  end

  
 def turn_count
   #counting how many game the elements on the @board has been filled 
   @board.count{|element| element != " "}
 end
 
 def current_player
   #this method help us to know whether our player is X or Y 
   if turn_count % 2 == 0 
     "X"
   else
     "O"
   end
  # binding.pry
 end
 
  def turn
    user_input = gets.strip
    index = input_to_index(user_input)
    # binding.pry
      if valid_move?(index)
        move(index, current_player)
        display_board
        # binding.pry
      else
        turn #call itself within its own context to run the same operation as above 
        move(index, current_player)
      end
  end
  
  def won?
     WIN_COMBINATIONS.each {|win_combo|
      index_0 = win_combo[0]
      index_1 = win_combo[1]
      index_2 = win_combo[2]
  
      position_1 = @board[index_0]
      position_2 = @board[index_1]
      position_3 = @board[index_2]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combo
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combo
    end
    }
    return false
  end
  
  
  def full?
    @board.all? {|index| index == "X" || index == "O"}
  end
  
  def draw?
    if full? && !won?
      true 
    else
      false
    end
  end
  
  def over?
    if won? || full?
      true
    else
      false
    end
  end
    
    
  def winner #?
    index = []
    index = won?
    # binding.pry
    if index == false
      return nil
    else
      if @board[index[0]] == "X"
        return "X"
      else
        return "O"
      end
    end
  end
  
  def play
    until over? == true
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
end  
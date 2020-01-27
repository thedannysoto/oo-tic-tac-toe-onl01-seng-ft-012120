require 'pry'
class TicTacToe
  
  
  def initialize
    @board = Array.new(9, " ")
    display_board
  end 
  
  WIN_COMBINATIONS = [
    [0, 1, 2], #top row 
    [3, 4, 5], #middle row
    [6, 7, 8], #bottom row 
    [0, 3, 6], #first column
    [1, 4, 7], #second column
    [2, 5, 8], #third column
    [0, 4, 8], #diagonal one 
    [2, 4, 6] #diagonal two
    ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(string)
    index = string.to_i - 1 
    index 
  end 
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(i)
    return @board[i] == "X" || @board[i] == "O" ? true: false 
  end
  
  def valid_move?(i)
    if @board[i] == " " && i.between?(0, 8)
      true 
    else 
      false 
    end
  end 
  
  def turn_count
    count = 0
    @board.each do |index|
      if index != " "
        count += 1 
      end 
    end 
    count 
  end 
  
  def current_player
    turn_count % 2 == 0 ? "X": "O"
  end 
    
  def turn
    puts "Choose a position 1-9:"
    input = gets.strip 
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
    else
      turn  
    end
    display_board
  end
    
  def won? 
   board_empty = @board.none? { |i| i == "X" || i = "O"}
    if board_empty
      false
    else 
      WIN_COMBINATIONS.each do |array| 
        if @board[array[0]] == "X" && @board[array[1]] == "X" && @board[array[2]] == "X" || @board[array[0]] == "O" && @board[array[1]] == "O" && @board[array[2]] == "O"
          return array
        end
      end
      return false
  end
end
  
  def full?
    @board.include?(" ") ? false: true
  end 
    
  def draw?
    won? == false && full?
  end
  
  def over?
    won? || draw? || full?
  end
  
  # The winner method shouldn't need to check for whether there is a winner or not
  # since it is only called after the won? method returns true. It is repetitive.
  # But I had to code it this way to pass the tests.
  
  def winner
    if !won?
      return nil
    end 
    @board[won?[0]]
  end 
  
  
  def play 
    until over?
      turn 
    end 
    
    if won?
        puts "Congratulations #{winner}!"
    else 
      puts "Cat's Game!"
    end 
  end 
  
end 
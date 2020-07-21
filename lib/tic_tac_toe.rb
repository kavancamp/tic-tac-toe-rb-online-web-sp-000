def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player)
    display_board(board)
  else
    turn(board)
  end
end

# Define your play method below
def play(board)
   counter = 0
   until counter == 9
     turn(board)
     counter += 1
   end
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end
def turn_count(board)
  turns = 0
  board.each do |space|
    if space == "X" || space == "O"
      turns += 1
    end
  end
  return turns
end

def current_player(board)
   turn_count(board) % 2 == 0 ? "X" : "O"
end
end
# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # top
  [3,4,5], # middle
  [6,7,8], # bottom
  [0,3,6], # left
  [1,4,7], # center
  [2,5,8], # right
  [0,4,8], # left diagonal
  [6,4,2]
]
def won?(board)
 WIN_COMBINATIONS.each {|win_combination|
   win_index_0 = win_combination[0]
   win_index_1 = win_combination[1]
   win_index_2 = win_combination[2]

      position_1 = board[win_index_0]
      position_2 = board[win_index_1]
      position_3 = board[win_index_2]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      end
}
return false
end

def full?(board)
   board.all?{|index| index == "X" || index == "O"}
end

def draw?(board)
 if !won?(board) && full?(board)
   return true
 else
   return false
 end
end

def over?(board)
 if won?(board) || draw?(board)
   return true
 else
   return false
 end
end

def winner(board)
 index = []
 index = won?(board)
 if index == false
   return nil
 else
  if board[index[0]] == "X"
    return "X"
  else return "O"
  end
 end
end

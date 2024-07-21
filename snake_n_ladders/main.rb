require_relative 'lib/game'

def main
  game = Game.new

  puts 'Enter the length and breadth of board:'
  length, breadth = gets.chomp.split.map(&:to_i)
  game.add_board(length: length, breadth: breadth)

  puts 'Enter number of dice to play with and length of die:'
  num_dies, length_of_die = gets.chomp.split.map(&:to_i)
  num_dies.times do
    game.add_dice(dice_length: length_of_die)
  end

  puts 'Enter the number of snakes:'
  num_snakes = gets.chomp.to_i
  num_snakes.times do
    start_pos, end_pos = gets.chomp.split.map(&:to_i)
    game.add_snake(start_pos, end_pos)
  end

  puts 'Enter the number of ladders:'
  num_ladders = gets.chomp.to_i
  num_ladders.times do
    start_pos, end_pos = gets.chomp.split.map(&:to_i)
    game.add_ladder(start_pos, end_pos)
  end

  puts 'Enter the number of players:'
  num_players = gets.chomp.to_i
  num_players.times do
    game.add_player(gets.chomp)
  end

  game.play
end

main

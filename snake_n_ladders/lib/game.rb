# frozen_string_literal: true

require_relative 'board'
require_relative 'dice'
require_relative 'user'
require_relative 'game_configuration'

class Game
  attr_accessor :board, :status, :players, :dies, :configuration

  def initialize
    @status = :to_start
    @dies = []
    @players = []
    @configuration = GameConfiguration.new(
      end_game_rule: GameConfiguration::EndGameRule::FIRST_TO_FINISH,
      invalid_dice_roll: GameConfiguration::InvalidDiceRoll::NONE,
      extra_dice_roll: GameConfiguration::ExtraDiceRoll::ON_LENGTH
    )
  end

  def add_board(length: 10, breadth: 10)
    @board = Board.new(length, breadth)
  end

  def add_player(name)
    @players << User.new(name)
  end

  def add_dice(dice_length: 6)
    @dies << Dice.new(dice_length)
  end

  def add_snake(start_pos, end_pos)
    @board.add_snake(start_pos, end_pos)
  end

  def add_ladder(start_pos, end_pos)
    @board.add_ladder(start_pos, end_pos)
  end

  def play
    until @status == :ended
      @players.each do |player|
        die_value = roll_die
        update_player_position(player, die_value)
        update_status

        break if @status == :ended
      end
    end
  end

  private

  def roll_die
    die_value = 0
    @dies.each do |dice|
      if @configuration.extra_dice_roll == GameConfiguration::ExtraDiceRoll::NONE
        current_dice_roll = dice.roll
      elsif @configuration.extra_dice_roll == GameConfiguration::ExtraDiceRoll::ON_LENGTH
        if @configuration.invalid_dice_roll == GameConfiguration::InvalidDiceRoll::NONE
          loop do
            current_dice_roll = dice.roll
            die_value += current_dice_roll
            break if current_dice_roll != dice.length || die_value >= @board.size
          end
        else
          3.times do
            current_dice_roll = dice.roll
            die_value += current_dice_roll
            break if current_dice_roll != dice.length
          end
          die_value = 0 if die_value == dice.length * 3
        end
      end
    end
    die_value
  end

  def update_status
    won_players = @players.select { |player| won?(player.position) }
    if @configuration.end_game_rule == GameConfiguration::EndGameRule::FIRST_TO_FINISH
      @status = won_players.count >= 1 ? :ended : :playing
    elsif @configuration.end_game_rule == GameConfiguration::EndGameRule::TILL_LAST_PLAYER
      @status = won_players.count >= players.count - 1 ? :ended : :playing
    else
      :playing
    end
  end

  def won?(position)
    position == @board.size
  end

  def update_player_position(player, die_value)
    new_player_position = @board.move(player.position, die_value)
    if won?(new_player_position)
      puts "#{player.name} won the game!!"
    else
      puts "#{player.name} rolled a #{die_value} and moved from #{player.position} to #{new_player_position}"
    end
    player.position = new_player_position
  end
end

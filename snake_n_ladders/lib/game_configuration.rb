# frozen_string_literal: true

class GameConfiguration
  module EndGameRule
    TILL_LAST_PLAYER = :till_last_player
    FIRST_TO_FINISH = :first_to_finish

    def self.all
      [TILL_LAST_PLAYER, FIRST_TO_FINISH]
    end
  end

  module ExtraDiceRoll
    ON_LENGTH = :on_length
    NONE = :none

    def self.all
      [ON_LENGTH, NONE]
    end
  end

  module InvalidDiceRoll
    THREE_SIXES = :three_sixes
    NONE = :none

    def self.all
      [THREE_SIXES, NONE]
    end
  end

  attr_accessor :end_game_rule, :invalid_dice_roll, :extra_dice_roll

  def initialize(end_game_rule: EndGameRule::TILL_LAST_PLAYER, invalid_dice_roll: InvalidDiceRoll::THREE_SIXES, extra_dice_roll: ExtraDiceRoll::ON_LENGTH)
    @end_game_rule = end_game_rule
    @invalid_dice_roll = invalid_dice_roll
    @extra_dice_roll = extra_dice_roll
  end
end

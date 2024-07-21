# frozen_string_literal: true

class Dice
  attr_accessor :length

  def initialize(length)
    @length = length
  end

  def roll
    rand(length) + 1
  end
end

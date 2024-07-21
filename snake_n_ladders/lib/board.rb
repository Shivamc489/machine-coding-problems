# frozen_string_literal: true
require_relative 'snake'
require_relative 'ladder'

class Board
  attr_writer :length, :breadth
  attr_reader :size, :snakes, :ladders

  def initialize(length, breadth)
    @length = length
    @breadth = breadth
    @size = @length * @breadth
    @snakes = []
    @ladders = []
  end

  def add_snake(start_pos, end_pos)
    snakes << Snake.new(start_pos, end_pos)
  end

  def add_ladder(start_pos, end_pos)
    ladders << Ladder.new(start_pos, end_pos)
  end

  def move(start_pos, steps_count)
    end_pos = start_pos + steps_count
    return start_pos if end_pos > @size

    loop do
      is_moving = false
      snake_found = snakes.find { |snake| snake.start_pos == end_pos }
      if snake_found
        end_pos = snake_found.end_pos
        is_moving = true
      end

      ladder_found = ladders.find { |ladder| ladder.start_pos == end_pos }
      if ladder_found
        end_pos = ladder_found.end_pos
        is_moving = true
      end

      break if is_moving == false
    end

    end_pos
  end
end
